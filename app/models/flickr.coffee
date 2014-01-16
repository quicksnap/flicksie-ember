Flickr = Ember.Object.extend {
  getPhotos: () ->
    $.ajax {
      url: 'http://api.flickr.com/services/rest/'
      data:
        method: 'flickr.photos.getRecent'
        api_key: '1cbbcda881bad35d5dd13634ad5b5035'
        per_page: 10
        format: 'json'
      jsonp: 'jsoncallback'
      dataType: 'jsonp'
      success: (data) =>
        @set('photos', data.photos.photo)
    }
    return @get('photos')
}

`export default Flickr`