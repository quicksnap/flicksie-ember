`import Flickr from 'appkit/models/flickr'`

ajaxStub = flickr = xhr = null
FLICKR_PHOTOS_RESPONSE = { "photos": { "page": 1, "pages": "200", "perpage": 5, "total": "1000", "photo": [
    { "id": "11715933295", "owner": "80242862@N08", "secret": "fe1b1fd4b8", "server": "5535", "farm": 6, "title": "Pannenkoekenschip", "ispublic": 1, "isfriend": 0, "isfamily": 0 },
    { "id": "11716194673", "owner": "41025162@N00", "secret": "509969fee8", "server": "5483", "farm": 6, "title": "IMG_5729", "ispublic": 1, "isfriend": 0, "isfamily": 0 },
    { "id": "11716301334", "owner": "39333259@N08", "secret": "d90c0b4f73", "server": "2807", "farm": 3, "title": "DSC_4886.jpg", "ispublic": 1, "isfriend": 0, "isfamily": 0 },
    { "id": "11716302744", "owner": "106569336@N07", "secret": "c2e60b8d48", "server": "5548", "farm": 6, "title": "OLYMPUS DIGITAL CAMERA", "ispublic": 1, "isfriend": 0, "isfamily": 0 },
    { "id": "11716302854", "owner": "112871545@N04", "secret": "92905206e1", "server": "5523", "farm": 6, "title": "", "ispublic": 1, "isfriend": 0, "isfamily": 0 }
  ] }, "stat": "ok" }

module "Unit - Models/flickr", {
  setup: () ->
    container = isolatedContainer ['model:flickr']
    flickr = container.lookup 'model:flickr'
    ajaxStub = sinon.stub(jQuery, "ajax").yieldsTo("success", FLICKR_PHOTOS_RESPONSE)
  teardown: () ->
    ajaxStub.restore()
}

test 'it instantiates', () ->
  ok flickr
  ok flickr instanceof Flickr

test 'it returns a list of photos from flickr', () ->
  photos = flickr.getPhotos()
  ok flickr.get('photos').length == 5
  ok photos.length == 5

