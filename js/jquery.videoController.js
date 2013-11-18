/*
	Name: Video Controller
*/
(function($) {
	
	function VideoController(instance, options) {		
		
		// contains all the settings for the video
		this.settings = $.extend({}, $.fn.videoController.defaults, options);
		
		
		var video = $(instance),
			
			// reference to the current object
			self = this,
			
			videoType,
			
			videoPlayer,
			
			youtubeAPILoaded = window.YT && window.YT.Player,
			
			vimeoReady = false,
			
			vimeoTimer,
			
			videoStarted = false,
			
			videoPlaying = false,
			
			videoURL = '';
			
		
		init();
		
		
		function init() {
			videoURL = video.attr('src');
			
			if (videoURL.indexOf('youtube') != -1)
				videoType = 'youtube-video';
			else if (videoURL.indexOf('vimeo') != -1)
				videoType = 'vimeo-video';
				
			switch (videoType) {
				case 'youtube-video':
					initYoutubeVideo();
					break;
				
				case 'vimeo-video':
					initVimeoPlayer();
					break;
				
				case 'flash-video':
				
					break;
				
				case 'html5-video':
				
					break;
			}
		}
		
		
		function initYoutubeVideo() {
			if (youtubeAPILoaded) {
				createYoutubePlayer();
			} else {
				var tag = document.createElement('script');
				tag.src = "http://www.youtube.com/player_api";
				var firstScriptTag = document.getElementsByTagName('script')[0];
				firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
				
				window.onYouTubePlayerAPIReady = function() {
					createYoutubePlayer();	
				}
			}			
		}
		
		
		function createYoutubePlayer() {
			videoPlayer = new YT.Player(video[0], {
				events: {
					'onStateChange': function(event) {
						switch (event.data) {
							case YT.PlayerState.BUFFERING:
								if (!videoStarted) {
									videoStarted = true;
									dispatch('start');
								}
								
								break;
								
							case YT.PlayerState.PLAYING:
								if (!videoStarted) {
									videoStarted = true;
									dispatch('start');
								}
								
								if (!videoPlaying) {
									videoPlaying = true;
									dispatch('play');
								}
								
								break;
							
							case YT.PlayerState.PAUSED:
								if (videoPlaying) {
									videoPlaying = false;
									dispatch('pause');
								}
								
								break;
							
							case YT.PlayerState.ENDED:
								dispatch('end');
								break;
						}
					}
				}
			});
		}
		
		
		function initVimeoPlayer() {
			videoPlayer = Froogaloop(video[0]);
			
			videoPlayer.addEvent('ready', function(data) {
				createVimeoPlayer();
			});
		}
		
		
		function createVimeoPlayer() {
			if (vimeoReady)
				return;
				
			vimeoReady = true;
			videoPlayer.removeEvent('ready');
			
			videoPlayer.addEvent('loadProgress', function(data) {
				if (!videoStarted) {
					videoStarted = true;
					dispatch('start');
				}
			});
			
			videoPlayer.addEvent('play', function(data) {
				if (!videoStarted) {
					videoStarted = true;
					dispatch('start');
				}
							
				if (!videoPlaying) {
					videoPlaying = true;
					dispatch('play');
				}
			});
			
			videoPlayer.addEvent('pause', function(data) {
				if (videoPlaying) {
					videoPlaying = false;
					dispatch('pause');
				}
			});
			
			videoPlayer.addEvent('finish', function(data) {
				dispatch('end');
			});
		}
		
		
		function leaveVideo() {			
			if (videoStarted && videoPlayer) {
				if (self.settings.leaveVideoAction == 'stopVideo') {
					stopVideo();
				} else if (self.settings.leaveVideoAction == 'pauseVideoAndBuffering') {	
					pauseVideoAndBuffering();
				} else if (self.settings.leaveVideoAction == 'pauseVideo') {
					pauseVideo();
				}
			}
		}
		
		
		function stopVideo() {
			if (videoType == 'youtube-video') {
				videoPlayer.seekTo(1);					
				videoPlayer.stopVideo();
			} else if(videoType == 'vimeo-video') {
				videoPlayer.api('pause');
				videoPlayer.api('unload');
			}
		}
		
		
		function pauseVideo() {
			if (videoType == 'youtube-video') {
				videoPlayer.pauseVideo();
			} else if(videoType == 'vimeo-video') {
				videoPlayer.api('pause');
			}
		}
		
		
		function pauseVideoAndBuffering() {
			if (videoType == 'youtube-video') {
				videoPlayer.stopVideo();
			} else if(videoType == 'vimeo-video') {
				videoPlayer.api('pause');
			}
		}
		
		
		function dispatch(message) {
			var eventObject = {type: message};
			
			switch (message) {
				case 'start':
					$.isFunction(self.settings.start) && self.settings.start.call(this, eventObject);
					break;				
				
				case 'play':
					$.isFunction(self.settings.play) && self.settings.play.call(this, eventObject);
					break;
					
				case 'pause':
					$.isFunction(self.settings.pause) && self.settings.pause.call(this, eventObject);
					break;
				
				case 'end':
					$.isFunction(self.settings.end) && self.settings.end.call(this, eventObject);
					break;				
			}
		}
		
		
		this.leaveVideo = leaveVideo;
		
		this.stopVideo = stopVideo;
		
		this.pauseVideo = pauseVideo;
		
		this.pauseVideoAndBuffering = pauseVideoAndBuffering;
		
	}
	
	
	$.fn.videoController = function(options) {
		var collection = [];
		
		for (var i = 0; i < this.length; i++) {
			if (!this[i].videoControllerInstance)
				this[i].videoControllerInstance = new VideoController(this[i], options);
			
			collection.push(this[i].videoControllerInstance);
		}
		
		// if there are more video instances, return the array of videos
		// it there is only one, return just the video instance
		return collection.length > 1 ? collection : collection[0];
	}
	
	
	// default settings
	$.fn.videoController.defaults =  {
		start: null,
		play: null,
		pause: null,
		end: null,
		leaveVideoAction: 'stopVideo' 
	};
	
})(jQuery)