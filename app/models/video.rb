Dotenv.load

class Video < ApplicationRecord
    has_many :favorites
    has_many :users, through: :favorites

    has_many :rooms
    has_many :users, through: :rooms

    validates :youTubeId, uniqueness: true 

    def self.search (query)
        key = ENV['API_KEY']
        response = RestClient.get("https://www.googleapis.com/youtube/v3/search?maxResults=10&q=#{query}h&key=#{key}")
        result = JSON.parse(response.body)
    end

    def get_video_details
        key = ENV['VIDEO_KEY']
        # binding.pry
        response = RestClient.get("https://www.googleapis.com/youtube/v3/videos?part=contentDetails&part=snippet&id=#{self.youTubeId}&key=#{key}")
        result = JSON.parse(response.body)
        # binding.pry
        self.title = result["items"][0]["snippet"]["title"]
        self.captions = result["items"][0]["contentDetails"]["caption"]
        self.description = result["items"][0]["snippet"]["description"]
        self.save!
        self.lyrics=get_lyrics(self.title)
        self.save!
    end

    def get_lyrics(song)
        binding.pry
        # song=self.title
        song=song.split(" feat.")[0]
        song=song.split(" ft")[0]
        song=song.split(" (")[0]
        song=song.tr(" ","-")
        response = RestClient.get("https://api.canarado.xyz/lyrics/#{song}")
        result = JSON.parse(response.body)
        title_line = result["content"][0]["title"]
        title = title_line.split(' by')[0].tr(" ","-")
        artist_line = result["content"][0]["artist"]
        artist=artist_line.tr(" ","-")
        response_search = RestClient.get("https://api.lyrics.ovh/v1/#{artist}/#{title}")
        result_search = JSON.parse(response_search.body)
        self.lyrics = result_search["lyrics"]
    end

    def join_nested_strings(src)
        joint=[]
        src.each do|subora|
          subora.each do|element|
            joint<<element if element.kind_of? String
          end
        end
        p joint.join(" ")
      end
      
end

#captionBool = result["items"]["contentDetails"]["captions"]
#title = result["items"]["snippet"]["title"]
#description = result["items"]["snippet"]["description"]


#Sample response from videos endpoint:
# {
#     "kind": "youtube#videoListResponse",
#     "etag": "dtqpxratTx0alS7RPqcVKkUO1wI",
#     "items": [
#       {
#         "kind": "youtube#video",
#         "etag": "3pmFSd7mPui_yufwUll2xHDc9UA",
#         "id": "B628-kgUtn4",
#         "snippet": {
#           "publishedAt": "2019-04-21T10:10:09Z",
#           "channelId": "UCO4Nw0vUpxgb0zsziJ1SaMg",
#           "title": "How to Add Captions to Videos ('Bake-in' Subtitles for Instagram Videos!)",
#           "description": "Learn how to add captions to videos and make videos with ‘baked-in’ subtitles and captions for Instagram, Facebook… you name it!\n\n-- LINKS --\n(When available, we use affiliate links and may earn a commission!)\n\nRecommended Services:\n► Rev.com: https://primalvideo.com/go/rev\n► Splasheo: https://primalvideo.com/go/splasheo/\n\n\nRecommended Mobile Apps:\n► Clips (iOS): https://primalvideo.com/go/apple-clips/\n► Clipomatic (iOS): https://primalvideo.com/go/clipomatic/\n► Autocap (Android): https://primalvideo.com/go/autocap-android/\n► Quicc (Android/iOS): https://primalvideo.com/go/quicc/\n\nHow to Hire a Video Editor:\n► https://youtu.be/tc9FFfJJDao\n\n*** GEAR WE USE ***\nhttps://primalvideo.com/gear\n\n🚀  Join the Primal Video Accelerator waitlist: https://primalvideo.com/pvaccelerator  🚀\nLearn how to build an audience, generate new leads on autopilot and SCALE your business with video step-by-step in our fast-track Primal Video Accelerator program!\n\n--\n\n~ Learn how to GROW your email list on autopilot with YouTube (Free Primal Video Insider training!): https://primalvideo.com/email-list-growth-engine-workshop ~\n\nBecome a Primal Video Insider (100% free) to access advanced workshops, bonus trainings, and regular PV updates: http://primalvideo.com/subscribe\n\n-- How to Add Captions to Videos ('Bake-in' Subtitles for Instagram Videos!) --\n\nWant to learn how to make those Facebook or Instagram caption videos, where the subtitles are INSIDE the video? You know the ones... with those obligatory bars at the top and bottom of the video with a fancy bright color to get attention?\n\nWell, good news is you’re not alone - it’s probably the number 1 question we get right now!\n\nAnd for good reason too. While it may LOOK simple, it’s not as easy as just adding text to videos… Because you’re dealing with subtitles that change every second or two, with the wrong approach you could spend hours manually syncing up the video and audio.\n\nBut you know that’s not how we do things here! In this video we cover the easiest way we’ve found to add captions to Instagram videos, Facebook videos… ANY videos (!), and ‘bake-in’ subtitles easy and fast.\n\n**********\nGEAR WE USE:  http://primalvideo.com/gear\nCheck out all the gear we use and recommend at Primal Video!\n**********\n\n--- Related Content ---\n- How to Make a Thumbnail for YouTube Videos - Easy & Free! https://www.youtube.com/watch?v=Sp3dFF-Bts0\n- How to Make a Video Intro for YouTube: https://www.youtube.com/watch?v=UbF-GI558q8\n- How to GROW Your Business with YouTube: https://www.youtube.com/watch?v=TQRTrJDn82w\n\n#InstagramVideo #VideoMarketing #YouTubeForBusiness #PrimalVideo\n\nDISCLOSURE: We often review or link to products & services we regularly use and think you might find helpful. Wherever possible we use referral links, which means if you click one of the links in this video or description and make a purchase we may receive a small commission or other compensation. \n\nWe're big fans of Amazon, and many of our links to products/gear are links to those products on Amazon. We are a participant in the Amazon Services LLC Associates Program, an affiliate advertising program designed to provide a means for us to earn fees by linking to Amazon.com and related sites.",
#           "thumbnails": {
#             "default": {
#               "url": "https://i.ytimg.com/vi/B628-kgUtn4/default.jpg",
#               "width": 120,
#               "height": 90
#             },
#             "medium": {
#               "url": "https://i.ytimg.com/vi/B628-kgUtn4/mqdefault.jpg",
#               "width": 320,
#               "height": 180
#             },
#             "high": {
#               "url": "https://i.ytimg.com/vi/B628-kgUtn4/hqdefault.jpg",
#               "width": 480,
#               "height": 360
#             },
#             "standard": {
#               "url": "https://i.ytimg.com/vi/B628-kgUtn4/sddefault.jpg",
#               "width": 640,
#               "height": 480
#             },
#             "maxres": {
#               "url": "https://i.ytimg.com/vi/B628-kgUtn4/maxresdefault.jpg",
#               "width": 1280,
#               "height": 720
#             }
#           },
#           "channelTitle": "Justin Brown - Primal Video",
#           "tags": [
#             "how to add captions to videos",
#             "how to add captions to your instagram videos",
#             "how to add captions to youtube videos",
#             "add captions to videos",
#             "how to add captions in instagram",
#             "add captions to instagram videos",
#             "how to add subtitles to instagram videos",
#             "how to subtitle instagram videos",
#             "adding text to videos",
#             "caption videos for instagram",
#             "add text to instagram videos",
#             "instagram captions",
#             "instagram subtitles app",
#             "instagram subtitles video",
#             "#PrimalVideoTV",
#             "justin brown",
#             "primal video"
#           ],
#           "categoryId": "1",
#           "liveBroadcastContent": "none",
#           "defaultLanguage": "en",
#           "localized": {
#             "title": "How to Add Captions to Videos ('Bake-in' Subtitles for Instagram Videos!)",
#             "description": "Learn how to add captions to videos and make videos with ‘baked-in’ subtitles and captions for Instagram, Facebook… you name it!\n\n-- LINKS --\n(When available, we use affiliate links and may earn a commission!)\n\nRecommended Services:\n► Rev.com: https://primalvideo.com/go/rev\n► Splasheo: https://primalvideo.com/go/splasheo/\n\n\nRecommended Mobile Apps:\n► Clips (iOS): https://primalvideo.com/go/apple-clips/\n► Clipomatic (iOS): https://primalvideo.com/go/clipomatic/\n► Autocap (Android): https://primalvideo.com/go/autocap-android/\n► Quicc (Android/iOS): https://primalvideo.com/go/quicc/\n\nHow to Hire a Video Editor:\n► https://youtu.be/tc9FFfJJDao\n\n*** GEAR WE USE ***\nhttps://primalvideo.com/gear\n\n🚀  Join the Primal Video Accelerator waitlist: https://primalvideo.com/pvaccelerator  🚀\nLearn how to build an audience, generate new leads on autopilot and SCALE your business with video step-by-step in our fast-track Primal Video Accelerator program!\n\n--\n\n~ Learn how to GROW your email list on autopilot with YouTube (Free Primal Video Insider training!): https://primalvideo.com/email-list-growth-engine-workshop ~\n\nBecome a Primal Video Insider (100% free) to access advanced workshops, bonus trainings, and regular PV updates: http://primalvideo.com/subscribe\n\n-- How to Add Captions to Videos ('Bake-in' Subtitles for Instagram Videos!) --\n\nWant to learn how to make those Facebook or Instagram caption videos, where the subtitles are INSIDE the video? You know the ones... with those obligatory bars at the top and bottom of the video with a fancy bright color to get attention?\n\nWell, good news is you’re not alone - it’s probably the number 1 question we get right now!\n\nAnd for good reason too. While it may LOOK simple, it’s not as easy as just adding text to videos… Because you’re dealing with subtitles that change every second or two, with the wrong approach you could spend hours manually syncing up the video and audio.\n\nBut you know that’s not how we do things here! In this video we cover the easiest way we’ve found to add captions to Instagram videos, Facebook videos… ANY videos (!), and ‘bake-in’ subtitles easy and fast.\n\n**********\nGEAR WE USE:  http://primalvideo.com/gear\nCheck out all the gear we use and recommend at Primal Video!\n**********\n\n--- Related Content ---\n- How to Make a Thumbnail for YouTube Videos - Easy & Free! https://www.youtube.com/watch?v=Sp3dFF-Bts0\n- How to Make a Video Intro for YouTube: https://www.youtube.com/watch?v=UbF-GI558q8\n- How to GROW Your Business with YouTube: https://www.youtube.com/watch?v=TQRTrJDn82w\n\n#InstagramVideo #VideoMarketing #YouTubeForBusiness #PrimalVideo\n\nDISCLOSURE: We often review or link to products & services we regularly use and think you might find helpful. Wherever possible we use referral links, which means if you click one of the links in this video or description and make a purchase we may receive a small commission or other compensation. \n\nWe're big fans of Amazon, and many of our links to products/gear are links to those products on Amazon. We are a participant in the Amazon Services LLC Associates Program, an affiliate advertising program designed to provide a means for us to earn fees by linking to Amazon.com and related sites."
#           },
#           "defaultAudioLanguage": "en"
#         },
#         "contentDetails": {
#           "duration": "PT19M11S",
#           "dimension": "2d",
#           "definition": "hd",
#           "caption": "true",
#           "licensedContent": true,
#           "contentRating": {},
#           "projection": "rectangular"
#         }
#       }
#     ],
#     "pageInfo": {
#       "totalResults": 1,
#       "resultsPerPage": 1
#     }
#   }
  