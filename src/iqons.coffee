# coffeelint: disable=max_line_length
_ = require 'lodash'

parts =
  top:
    'top_01.svg': require './svg/top/top_01.svg'
    'top_02.svg': require './svg/top/top_02.svg'
    'top_03.svg': require './svg/top/top_03.svg'
    'top_04.svg': require './svg/top/top_04.svg'
    'top_05.svg': require './svg/top/top_05.svg'
    'top_06.svg': require './svg/top/top_06.svg'
    'top_07.svg': require './svg/top/top_07.svg'
    'top_08.svg': require './svg/top/top_08.svg'
    'top_09.svg': require './svg/top/top_09.svg'
    'top_10.svg': require './svg/top/top_10.svg'
    'top_11.svg': require './svg/top/top_11.svg'
    'top_12.svg': require './svg/top/top_12.svg'
    'top_13.svg': require './svg/top/top_13.svg'
    'top_14.svg': require './svg/top/top_14.svg'
    'top_15.svg': require './svg/top/top_15.svg'
    'top_16.svg': require './svg/top/top_16.svg'
    'top_17.svg': require './svg/top/top_17.svg'
    'top_18.svg': require './svg/top/top_18.svg'
    'top_19.svg': require './svg/top/top_19.svg'
    'top_20.svg': require './svg/top/top_20.svg'
    'top_21.svg': require './svg/top/top_21.svg'
  side:
    'side_01.svg': require './svg/side/side_01.svg'
    'side_02.svg': require './svg/side/side_02.svg'
    'side_03.svg': require './svg/side/side_03.svg'
    'side_04.svg': require './svg/side/side_04.svg'
    'side_05.svg': require './svg/side/side_05.svg'
    'side_06.svg': require './svg/side/side_06.svg'
    'side_07.svg': require './svg/side/side_07.svg'
    'side_08.svg': require './svg/side/side_08.svg'
    'side_09.svg': require './svg/side/side_09.svg'
    'side_10.svg': require './svg/side/side_10.svg'
    'side_11.svg': require './svg/side/side_11.svg'
    'side_12.svg': require './svg/side/side_12.svg'
    'side_13.svg': require './svg/side/side_13.svg'
    'side_14.svg': require './svg/side/side_14.svg'
    'side_15.svg': require './svg/side/side_15.svg'
    'side_16.svg': require './svg/side/side_16.svg'
    'side_17.svg': require './svg/side/side_17.svg'
    'side_18.svg': require './svg/side/side_18.svg'
    'side_19.svg': require './svg/side/side_19.svg'
    'side_20.svg': require './svg/side/side_20.svg'
    'side_21.svg': require './svg/side/side_21.svg'
  face:
    'face_01.svg': require './svg/face/face_01.svg'
    'face_02.svg': require './svg/face/face_02.svg'
    'face_03.svg': require './svg/face/face_03.svg'
    'face_04.svg': require './svg/face/face_04.svg'
    'face_05.svg': require './svg/face/face_05.svg'
    'face_06.svg': require './svg/face/face_06.svg'
    'face_07.svg': require './svg/face/face_07.svg'
    'face_08.svg': require './svg/face/face_08.svg'
    'face_09.svg': require './svg/face/face_09.svg'
    'face_10.svg': require './svg/face/face_10.svg'
    'face_11.svg': require './svg/face/face_11.svg'
    'face_12.svg': require './svg/face/face_12.svg'
    'face_13.svg': require './svg/face/face_13.svg'
    'face_14.svg': require './svg/face/face_14.svg'
    'face_15.svg': require './svg/face/face_15.svg'
    'face_16.svg': require './svg/face/face_16.svg'
    'face_17.svg': require './svg/face/face_17.svg'
    'face_18.svg': require './svg/face/face_18.svg'
    'face_19.svg': require './svg/face/face_19.svg'
    'face_20.svg': require './svg/face/face_20.svg'
    'face_21.svg': require './svg/face/face_21.svg'
  bottom:
    'bottom_01.svg': require './svg/bottom/bottom_01.svg'
    'bottom_02.svg': require './svg/bottom/bottom_02.svg'
    'bottom_03.svg': require './svg/bottom/bottom_03.svg'
    'bottom_04.svg': require './svg/bottom/bottom_04.svg'
    'bottom_05.svg': require './svg/bottom/bottom_05.svg'
    'bottom_06.svg': require './svg/bottom/bottom_06.svg'
    'bottom_07.svg': require './svg/bottom/bottom_07.svg'
    'bottom_08.svg': require './svg/bottom/bottom_08.svg'
    'bottom_09.svg': require './svg/bottom/bottom_09.svg'
    'bottom_10.svg': require './svg/bottom/bottom_10.svg'
    'bottom_11.svg': require './svg/bottom/bottom_11.svg'
    'bottom_12.svg': require './svg/bottom/bottom_12.svg'
    'bottom_13.svg': require './svg/bottom/bottom_13.svg'
    'bottom_14.svg': require './svg/bottom/bottom_14.svg'
    'bottom_15.svg': require './svg/bottom/bottom_15.svg'
    'bottom_16.svg': require './svg/bottom/bottom_16.svg'
    'bottom_17.svg': require './svg/bottom/bottom_17.svg'
    'bottom_18.svg': require './svg/bottom/bottom_18.svg'
    'bottom_19.svg': require './svg/bottom/bottom_19.svg'
    'bottom_20.svg': require './svg/bottom/bottom_20.svg'
    'bottom_21.svg': require './svg/bottom/bottom_21.svg'

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
