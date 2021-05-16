# new_git_repository(
#     name = "fsmlite",
#     build_file = "//3rd/build_files:fsmlite.BUILD.bzl",
#     commit = "8808c256901003c1caf480ca68491ee3df17f01c",
#     remote = "https://github.com/build-with-bazel/fsmlite.git",
# )

load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "fsmlite",
    hdrs = ["fsm.h"],
    includes = ["."],
    visibility = ["//visibility:public"],
)