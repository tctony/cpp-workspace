# new_git_repository(
#     name = "ThreadPool",
#     build_file = "//3rd/build_files:ThreadPool.BUILD.bzl",
#     commit = "e0f9d9f7246ac2872efe63d19ca77151520b4a66",
#     remote = "https://github.com/build-with-bazel/ThreadPool.git",
# )

load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "ThreadPool",
    hdrs = ["ThreadPool.h"],
    includes = ["."],
    visibility = ["//visibility:public"],
)
