load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def tiro_talgreinir_core_repositories():
    # commit d54c78ab86b40770ee19f0949db9d74a831ab9f0
    rules_foreign_cc_version = "master"
    http_archive(
        name = "rules_foreign_cc",
        strip_prefix = "rules_foreign_cc-" + rules_foreign_cc_version,
        url = "https://github.com/bazelbuild/rules_foreign_cc/archive/{}.zip".format(rules_foreign_cc_version),
        # sha256 = "f358144776d3dfc5a928ef32a0e4fbe93c99b55772d70cca77a6478e34d96aa7",
        sha256 = "3e6b0691fc57db8217d535393dcc2cf7c1d39fc87e9adb6e7d7bab1483915110",
    )

    kaldi_version = "c7027423e4e73782e74dd3fb25acec8f3ff43670"
    new_git_repository(
        name = "kaldi",
        remote = "https://github.com/kaldi-asr/kaldi.git",
        commit = kaldi_version,
        shallow_since = "1578906033 +0800",
        build_file = "//third_party:kaldi.BUILD",
        strip_prefix = "src",
    )

    openfst_version = "1.6.7"
    http_archive(
        name = "openfst",
        urls = [
            "http://www.openfst.org/twiki/pub/FST/FstDownload/openfst-{}.tar.gz".format(openfst_version),
        ],
        sha256 = "e21a486d827cde6a592c8e91721e4540ad01a5ae35a60423cf17be4d716017f7",
        build_file = "//third_party:openfst.BUILD",
        strip_prefix = "openfst-" + openfst_version,
    )

    # OpenBLAS source code repository
    openblas_version = "0.3.7"
    http_archive(
        name = "openblas",
        urls = [
            "https://github.com/xianyi/OpenBLAS/archive/v{}.tar.gz".format(openblas_version),
        ],
        sha256 = "bde136122cef3dd6efe2de1c6f65c10955bbb0cc01a520c2342f5287c28f9379",
        build_file = "//third_party:openblas.BUILD",
        strip_prefix = "OpenBLAS-{}".format(openblas_version),
    )

    # spdlog
    spdlog_version = "1.8.0"
    http_archive(
        name = "spdlog",
        urls = [
            "https://github.com/gabime/spdlog/archive/v{}.tar.gz".format(spdlog_version),
        ],
        sha256 = "1e68e9b40cf63bb022a4b18cdc1c9d88eb5d97e4fd64fa981950a9cacf57a4bf",
        strip_prefix = "spdlog-{}".format(spdlog_version),
        build_file = "//third_party:spdlog.BUILD",
    )

    # gRPC
    #
    # Import this before we import "rules_proto_grpc" to control gRPC versioning
    grpc_version = "1.32.0"
    http_archive(
        name = "com_github_grpc_grpc",
        urls = ["https://github.com/grpc/grpc/archive/v{}.tar.gz".format(grpc_version)],
        sha256 = "f880ebeb2ccf0e47721526c10dd97469200e40b5f101a0d9774eb69efa0bd07a",
        strip_prefix = "grpc-{}".format(grpc_version),
    )

    # rules_proto_grpc
    rules_proto_grpc_version = "2.0.0"
    http_archive(
        name = "rules_proto_grpc",
        urls = [
            "https://github.com/rules-proto-grpc/rules_proto_grpc/archive/{}.tar.gz".format(rules_proto_grpc_version),
        ],
        sha256 = "d771584bbff98698e7cb3cb31c132ee206a972569f4dc8b65acbdd934d156b33",
        strip_prefix = "rules_proto_grpc-{}".format(rules_proto_grpc_version),
    )

    googleapis_version = "c8bfd324b41ad1f6f65fed124572f92fe116517b"
    http_archive(
        name = "com_google_googleapis",
        urls = [
            "https://github.com/googleapis/googleapis/archive/{}.zip".format(googleapis_version),
        ],
        sha256 = "63a25daee9f828582dc9266ab3f050f81b7089ce096c8c584ce85548c71ce7f1",
        strip_prefix = "googleapis-{}".format(googleapis_version),
    )

    # # ICU
    # http_archive(
    #     name = "icu",
    #     urls = [
    #         "https://github.com/unicode-org/icu/releases/download/release-67-1/icu4c-67_1-src.tgz"
    #     ],
    #     sha256 = "94a80cd6f251a53bd2a997f6f1b5ac6653fe791dfab66e1eb0227740fb86d5dc",
    #     strip_prefix = "icu",
    #     build_file = "//third_party:icu.BUILD",
    # )

    # # jsonformoderncpp
    # http_archive(
    #     name = "com_github_nlohmann_json",
    #     urls = ["https://github.com/nlohmann/json/releases/download/v3.9.1/include.zip"],
    #     sha256 = "6bea5877b1541d353bd77bdfbdb2696333ae5ed8f9e8cc22df657192218cad91",
    #     strip_prefix = "single_include",
    #     build_file = "//third_party:com_github_nlohmann_json.BUILD",
    # )

    # # concurrentqueue
    # http_archive(
    #     name = "com_github_cameron314_concurrentqueue",
    #     urls = ["https://github.com/cameron314/concurrentqueue/archive/1.0.2.tar.gz"],
    #     sha256 = "c3aeb97c97169f743a53ca33812ea2ab61dd06dfd28319ca3f0a0771372fc7fc",
    #     strip_prefix = "concurrentqueue-1.0.2",
    #     build_file = "//third_party:com_github_cameron314_concurrentqueue.BUILD",
    # )

    # ffmpeg
    # TODO(rkjaran): ffmpeg and all its deps
    # bzlib = True
    # fPIC = True
    # fdk_aac = True
    # lzma = True
    # mp3lame = True
    # openh264 = True
    # opus = True
    # postproc = False
    # vpx = True
    # x264 = True
    # x265 = True
    ffmpeg_version = "4.3.1"
    http_archive(
        name = "ffmpeg",
        urls = ["https://ffmpeg.org/releases/ffmpeg-{}.tar.gz".format(ffmpeg_version)],
        sha256 = "45035f15d6f192772de2309c846e1d60472694f479679354a39c699719e53772",
        strip_prefix = "ffmpeg-{}".format(ffmpeg_version),
        build_file = "//third_party:ffmpeg.BUILD",
    )

    # Catch2
    http_archive(
        name = "catch2",
        urls = ["https://github.com/catchorg/Catch2/archive/v2.13.1.tar.gz"],
        sha256 = "36bcc9e6190923961be11e589d747e606515de95f10779e29853cfeae560bd6c",
        strip_prefix = "Catch2-2.13.1",
    )

    # fmt
    fmt_version = "7.1.3"
    http_archive(
        name = "fmt",
        urls = [
            "https://github.com/fmtlib/fmt/releases/download/{fmt}/fmt-{fmt}.zip".format(fmt = fmt_version),
        ],
        sha256 = "5d98c504d0205f912e22449ecdea776b78ce0bb096927334f80781e720084c9f",
        strip_prefix = "fmt-{}".format(fmt_version),
        build_file = "//third_party:fmt.BUILD",
    )

    http_archive(
        name = "bzip2",
        urls = [
            "https://src.fedoraproject.org/repo/pkgs/bzip2/bzip2-1.0.6.tar.gz/00b516f4704d4a7cb50a1d97e6e8e15b/bzip2-1.0.6.tar.gz",
            "http://anduin.linuxfromscratch.org/LFS/bzip2-1.0.6.tar.gz",
            "https://fossies.org/linux/misc/bzip2-1.0.6.tar.gz",
            "http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz",
        ],
        sha256 = "a2848f34fcd5d6cf47def00461fcb528a0484d8edef8208d6d2e2909dc61d9cd",
        strip_prefix = "bzip2-1.0.6",
        build_file = "//third_party:bzip2.BUILD",
    )

    bazel_deps_version = "457a92bc426f23146d4edeb72fb96fd214684426"
    http_archive(
        name = "com_github_mjbots_bazel_deps",
        urls = ["https://github.com/mjbots/bazel_deps/archive/{}.zip".format(bazel_deps_version)],
        sha256 = "520cbe8cc5e960ba39f079e9001b8f992e4614cab08720b27afa47a65fe8566b",
        strip_prefix = "bazel_deps-{}".format(bazel_deps_version),
    )

    bazel_gazelle_version = "0.22.2"
    http_archive(
        name = "bazel_gazelle",
        sha256 = "b85f48fa105c4403326e9525ad2b2cc437babaa6e15a3fc0b1dbab0ab064bc7c",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v{v}/bazel-gazelle-v{v}.tar.gz".format(v = bazel_gazelle_version),
            "https://github.com/bazelbuild/bazel-gazelle/releases/download/v{v}/bazel-gazelle-v{v}.tar.gz".format(v = bazel_gazelle_version),
        ],
    )

    # Needed for buildifier
    com_github_bazelbuild_buildtools_version = "3.5.0"
    http_archive(
        name = "com_github_bazelbuild_buildtools",
        strip_prefix = "buildtools-{}".format(com_github_bazelbuild_buildtools_version),
        url = "https://github.com/bazelbuild/buildtools/archive/{}.zip".format(com_github_bazelbuild_buildtools_version),
        sha256 = "f5b666935a827bc2b6e2ca86ea56c796d47f2821c2ff30452d270e51c2a49708",
    )

    io_bazel_rules_go_version = "0.25.1"
    http_archive(
        name = "io_bazel_rules_go",
        sha256 = "7904dbecbaffd068651916dce77ff3437679f9d20e1a7956bff43826e7645fcc",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v{v}/rules_go-v{v}.tar.gz".format(v = io_bazel_rules_go_version),
            "https://github.com/bazelbuild/rules_go/releases/download/v{v}/rules_go-v{v}.tar.gz".format(v = io_bazel_rules_go_version),
        ],
    )