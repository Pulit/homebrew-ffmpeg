class Svtav1 < Formula
    desc "SVT AV1 Codec"
    homepage "https://github.com/OpenVisualCloud/SVT-AV1"
    url "https://github.com/OpenVisualCloud/SVT-AV1/archive/6da24e253445d21095058dadce14bbf758987d66.zip"
    version "0.8.4_6da24e2534" # to distinguish from homebrew-core's ffmpeg
    sha256 "6dfd1240590376c0eed9c912d9506247dd7c4ad935276f0f235b5666778c03f5"
    revision 1
    head "https://github.com/OpenVisualCloud/SVT-AV1"

    depends_on "nasm" => :build
    depends_on "cmake"

    def install
      args = %W[
        -DCMAKE_BUILD_TYPE=Release
      ]

      mkdir "build" do
        system "cmake", "-G", "Unix Makefiles", "..", *(std_cmake_args + args)
        system "make"
        system "make", "install"
      end
    end

    test do
      # `test do` will create, run in and delete a temporary directory.
      #
      # This test will fail and we won't accept that! It's enough to just replace
      # "false" with the main program this formula installs, but it'd be nice if you
      # were more thorough. Run the test with `brew test cmake-basis`. Options passed
      # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
      #
      # The installed folder is not in the path, so use the entire path to any
      # executables being tested: `system "#{bin}/program", "do", "something"`.
      system "false"
    end
  end
