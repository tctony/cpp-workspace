load("//tools/bazel:load_tool.bzl", "load_deps_if_needed")

load_deps_if_needed({
    "bazel_skylib": {
        "urls": [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
            "https://github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
        ],
        "sha256": "97e70364e9249702246c0e9444bccdc4b847bed1eb03c5a3ece4f83dfe6abc44",
    },
    "rules_foreign_cc": {
        "strip_prefix": "rules_foreign_cc-0.1.0",
        "url": "https://github.com/bazelbuild/rules_foreign_cc/archive/0.1.0.zip",
        "sha256": "c2cdcf55ffaf49366725639e45dedd449b8c3fe22b54e31625eb80ce3a240f1e",
    },
    "rules_proto": {
        "sha256": "6117a0f96af1d264747ea3f3f29b7b176831ed8acfd428e04f17c48534c83147",
        "strip_prefix": "rules_proto-8b81c3ccfdd0e915e46ffa888d3cdb6116db6fa5",
        # commit date 2020-04-01
        "urls": [
            "https://github.com/bazelbuild/rules_proto/archive/8b81c3ccfdd0e915e46ffa888d3cdb6116db6fa5.tar.gz",
        ],
    },
})

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

# for openssl
load("@rules_foreign_cc//:workspace_definitions.bzl", "rules_foreign_cc_dependencies")

rules_foreign_cc_dependencies()

# https://github.com/protocolbuffers/protobuf
# v3.15.5
# use local protobuf for rules_proto
local_repository(
    name = "com_google_protobuf",
    path = "../lib/protobuf",
)

load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")

rules_proto_dependencies()

rules_proto_toolchains()

# https://github.com/build-with-bazel/openssl.git
# 1.1.1
local_repository(
    name = "openssl",
    path = "../lib/openssl",
)

# https://github.com/google/boringssl
# master-with-bazel, 57c37a99b6a9f523b10344b7b6b93ce9ad1da795 
local_repository(
    name = "boringssl", 
    path = "../lib/boringssl",
)

# https://github.com/abseil/abseil-cpp
# lts_2021_03_24
local_repository(
    name = "abseil",
    path = "../lib/abseil-cpp",
)

# https://github.com/google/googletest
# 1.10
# avoid name conflict
local_repository(
    name = "gtest_local",
    path = "../lib/googletest",
)

bind(
    name = "gtest_main",
    actual = "@gtest_local//:gtest_main",
)

# https://github.com/grpc/grpc
# v1.36.1
local_repository(
    name = "com_github_grpc_grpc",
    path = "../lib/grpc",
)

load("@com_github_grpc_grpc//bazel:grpc_deps.bzl", "grpc_deps")

grpc_deps()

load("@com_github_grpc_grpc//bazel:grpc_extra_deps.bzl", "grpc_extra_deps")

grpc_extra_deps()


# https://github.com/build-with-bazel/asio.git
# asio 1.16
local_repository(
    name = "asio",
    path = "../lib/asio",
)

# https://github.com/build-with-bazel/ThreadPool.git@build_with_bazel
local_repository(
    name = "ThreadPool",
    path = "../lib/ThreadPool",
)

# https://github.com/build-with-bazel/fsmlite
local_repository(
    name = "fsmlite",
    path = "../lib/fsmlite",
)

# https://github.com/build-with-bazel/lsignal
# 59f6843dc2905626d637d17472fa2452c5936bfc
local_repository(
    name = "lsignal",
    path = "../lib/lsignal",
)

load("//tools/bazel_compile_commands:deps_load.bzl", "bazel_compile_commands_deps_load")

bazel_compile_commands_deps_load()
