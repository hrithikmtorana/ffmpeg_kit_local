Pod::Spec.new do |s|
  s.name             = 'ffmpeg_kit_flutter_full_gpl_2'
  s.version          = '6.0.3'
  s.summary          = 'FFmpeg Kit for Flutter (Full GPL build)'
  s.description      = <<-DESC
    A Flutter plugin for running FFmpeg and FFprobe commands.
    This build includes the complete GPL-licensed FFmpeg functionality.
  DESC
  s.homepage = 'https://github.com/hrithikmtorana/ffmpeg-kit-local'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'ARTHENICA' => 'open-source@arthenica.com' }

  s.platform            = :ios
  s.requires_arc        = true
  s.static_framework    = true

  s.source              = { :path => '.' }
  s.source_files        = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'

  # Use only the "full-gpl" subspec.
  s.default_subspec = 'full-gpl'

  s.dependency 'Flutter'
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386'
  }

  s.subspec 'full-gpl' do |ss|
    ss.source_files        = 'Classes/**/*'
    ss.public_header_files = 'Classes/**/*.h'
    # Unzip the local file during pod installation.
    ss.prepare_command = 'unzip -o "${POD_FILE_DIR}/vendor/ffmpeg-kit-ios-full-gpl_2.zip" -d "${POD_FILE_DIR}/vendor/ffmpeg-kit-ios-full-gpl_2"'
    # Reference the vendored framework from the unzipped folder.
    ss.vendored_frameworks = "${POD_FILE_DIR}/vendor/ffmpeg-kit-ios-full-gpl/ffmpegkit.framework"
    ss.ios.deployment_target = '12.1'
  end

end
