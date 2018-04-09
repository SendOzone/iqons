# coffeelint: disable=max_line_length
_ = require 'lodash'

unless window?
  _fs = 'fs'
  fs = require _fs

requireDir = (dir) ->
  if dir.keys?
    r = dir
    _.zipObject _.map(r.keys(), (x) -> x.slice 2), r.keys().map(r)
  else
    dir = __dirname + '/' + dir
    files = fs.readdirSync dir
    _.zipObject files, _.map files, (svg) ->
      fs.readFileSync dir + '/' + svg, 'utf8'

parts =
  top: if window?
    requireDir require.context './svg/top', false, /\.svg$/
  else
    requireDir './svg/top'
  side: if window?
    requireDir require.context './svg/side', false, /\.svg$/
  else
    requireDir './svg/side'
  face: if window?
    requireDir require.context './svg/face', false, /\.svg$/
  else
    requireDir './svg/face'
  bottom: if window?
    requireDir require.context './svg/bottom', false, /\.svg$/
  else
    requireDir './svg/bottom'

COLORS = [
  '#fb8c00'
  '#d32f2f'
  '#fbc02d'
  '#3949ab'
  '#03a9f4'
  '#8e24aa'
  '#009688'
  '#f06292'
  '#7cb342'
  '#795548'
]

ASSET_COUNTS = {
  'face': 21,
  'side': 21,
  'top': 21,
  'bottom': 21,
  'gaze': 2
}

assetIndex = (index, part) ->
  index = (Number(index) % ASSET_COUNTS[part]) + 1
  if index < 10
    index = '0' + index
  return index

renderPart = (part, index) ->
  parts[part]["#{part}_#{assetIndex(index, part)}.svg"]

chaosHash = (number) ->
  k = 3.569956786876
  a_n = 1 / number
  i = 0
  while i < 100
    a_n = (1 - a_n) * a_n * k
    i += 1
  a_n

hash = (text) ->
  ('' + text.split('').map((c) ->
    Number(c.charCodeAt(0)) + 3
  ).reduce(((a, e) ->
    a * (1 - a) * chaosHash(e)
  ), 0.5)).split('').reduce(((a, e) ->
    e + a
  ), '').substr 4, 17

iqon = ([
    color, backgroundColor, faceNr, topNr, sidesNr, bottomNr, accentColor, gaze
  ]) ->
    color = parseInt(color)
    backgroundColor = parseInt(backgroundColor)
    accentColor = parseInt(accentColor)

    if color is backgroundColor
      color += 1
      if color > 9
        color = 0
    while accentColor is color or accentColor is backgroundColor
      accentColor += 1
      if accentColor > 9
        accentColor = 0

    color = COLORS[color]
    backgroundColor = COLORS[backgroundColor]
    accentColor = COLORS[accentColor]

    """
        <g style="color:#{color}; fill:#{accentColor};">
            <rect fill="#{backgroundColor}" x="0" y="0" width="160" height="160"></rect>
            <circle cx="80" cy="80" r="40" fill="#{color}"></circle>
            <g opacity=".1" fill="#010101"><path d="M119.21,80a39.46,39.46,0,0,1-67.13,28.13c10.36,2.33,36,3,49.82-14.28,10.39-12.47,8.31-33.23,4.16-43.26A39.35,39.35,0,0,1,119.21,80Z"/></g>
            #{renderPart('top', topNr)}
            #{renderPart('side', sidesNr)}
            #{renderPart('face', faceNr)}
            #{renderPart('bottom', bottomNr)}
        </g>
    """

wrapper = (content) ->
  """
    <svg viewBox="0 0 160 160" width="160" height="160" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/2000/xlink" >
        <defs>
            <clipPath id="hexagon-clip" transform="scale(0.5) translate(0, 16)">
                <path d="M251.6 17.34l63.53 110.03c5.72 9.9 5.72 22.1 0 32L251.6 269.4c-5.7 9.9-16.27 16-27.7 16H96.83c-11.43 0-22-6.1-27.7-16L5.6 159.37c-5.7-9.9-5.7-22.1 0-32L69.14 17.34c5.72-9.9 16.28-16 27.7-16H223.9c11.43 0 22 6.1 27.7 16z"/>
            </clipPath>
        </defs>
        <path fill="white" transform="translate(0, 8) scale(0.5)" d="M251.6 17.34l63.53 110.03c5.72 9.9 5.72 22.1 0 32L251.6 269.4c-5.7 9.9-16.27 16-27.7 16H96.83c-11.43 0-22-6.1-27.7-16L5.6 159.37c-5.7-9.9-5.7-22.1 0-32L69.14 17.34c5.72-9.9 16.28-16 27.7-16H223.9c11.43 0 22 6.1 27.7 16z"/>
        <g transform="scale(0.9) translate(9, 8)">
            <g clip-path="url(#hexagon-clip)">
                #{content}
            </g>
        </g>
    </svg>
  """

# TODO: update with changes after Feb 28
# https://github.com/nimiq/iqons
module.exports =
  render: (text) ->
    hashed = hash(text)
    wrapper iqon [
      hashed[0]
      hashed[2]
      hashed[3] + hashed[4]
      hashed[5] + hashed[6]
      hashed[7] + hashed[8]
      hashed[9] + hashed[10]
      hashed[11]
    ]
