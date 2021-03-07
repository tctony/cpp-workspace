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
        "strip_prefix": "rules_foreign_cc-74b146dc87d37baa1919da1e8f7b8aafbd32acd9",
        # 2020-05-08
        "url": "https://github.com/bazelbuild/rules_foreign_cc/archive/74b146dc87d37baa1919da1e8f7b8aafbd32acd9.zip",
        "sha256": "2de65ab702ebd0094da3885aae2a6a370df5edb4c9d0186096de79dffb356dbc",
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
# v3.11.3
# use local protobuf for rules_proto
local_repository(
    name = "com_google_protobuf",
    path = "../lib/protobuf",
)

load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")

rules_proto_dependencies()

rules_proto_toolchains()

# https://github.com/tctony/build_openssl_with_bazel.git
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
# 20200225.1
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

# https://github.com/grpc/grpc@v1.28.1
local_repository(
    name = "com_github_grpc_grpc",  # 1.28.1
    path = "../lib/grpc",
)

load("@com_github_grpc_grpc//bazel:grpc_deps.bzl", "grpc_deps")

grpc_deps()

load("@com_github_grpc_grpc//bazel:grpc_extra_deps.bzl", "grpc_extra_deps")

grpc_extra_deps()


# https://github.com/tctony/build_asio_with_bazel.git
# asio 1.16
local_repository(
    name = "asio",
    path = "../lib/asio",
)

# https://github.com/tctony/ThreadPool.git@build_with_bazel
local_repository(
    name = "ThreadPool",
    path = "../lib/ThreadPool",
)

load("//tools/bazel_compile_commands:deps_load.bzl", "bazel_compile_commands_deps_load")

bazel_compile_commands_deps_load()
