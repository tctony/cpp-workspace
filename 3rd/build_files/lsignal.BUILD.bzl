# new_git_repository(
#     name = "lsignal",
#     build_file = "//3rd/build_files:lsignal.BUILD.bzl",
#     commit = "59f6843dc2905626d637d17472fa2452c5936bfc",
#     remote = "https://github.com/build-with-bazel/lsignal.git",
# )

load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "lsignal",
    hdrs = ["lsignal.h"],
    includes = ["."],
    visibility = ["//visibility:public"],
)
