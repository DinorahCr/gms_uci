jQuery ->
  new CarrierWaveCropper()

class CarrierWaveCropper
  constructor: ->
    $('#member_image_cropbox').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 200, 200]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#member_image_crop_x').val(coords.x)
    $('#member_image_crop_y').val(coords.y)
    $('#member_image_crop_w').val(coords.w)
    $('#member_image_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    $('#member_image_previewbox').css
      width: Math.round(100/coords.w * $('#member_image_cropbox').width()) + 'px'
      height: Math.round(100/coords.h * $('#member_image_cropbox').height()) + 'px'
      marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'
