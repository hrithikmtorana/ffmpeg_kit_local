Pod::Spec.new do |s|
  s.name             = 'ffmpeg_kit_flutter_full_gpl_2'
  s.version          = '6.0.3'
  s.summary          = 'FFmpeg Kit for Flutter (Full GPL build)'
  s.description      = <<-DESC
    A Flutter plugin for running FFmpeg and FFprobe commands.
    This build includes the complete GPL-licensed FFmpeg functionality.
  DESC
  s.homepage         = 'https://github.com/hrithikmtorana/ffmpeg_kit_local'
  s.license          = { :type => 'GPL-3.0', :file => '../LICENSE' }
  s.author           = { 'Hrithik Torana' => 'you@example.com' }

  s.platform            = :ios, '12.1'
  s.requires_arc        = true
  s.static_framework    = true

  # ✅ Use GitHub release ZIP directly
  s.source = {
    :http => 'https://github.com/hrithikmtorana/ffmpeg_kit_local/releases/download/v6.0.3/ffmpeg-kit-ios-full-gpl_2.zip'
  }

  # ✅ CocoaPods auto-unzips; point directly to the unzipped framework
  s.vendored_frameworks = 'ffmpegkit.framework'

  s.source_files        = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'

  s.dependency 'Flutter'
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386'
  }
end
