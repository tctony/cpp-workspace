import os

local_repos = [
  # [ dir, url, branch/tag, need_submodule, ],
  ['protobuf', 'https://github.com/protocolbuffers/protobuf', 'v3.15.5', False, ],
  ['openssl', 'https://github.com/build-with-bazel/openssl', 'master', True, ], #1.1.1
  ['boringssl', 'https://github.com/google/boringssl', 'master-with-bazel', False, ], #
  ['abseil-cpp', 'https://github.com/abseil/abseil-cpp', 'lts_2021_03_24', False, ],
  ['googletest', ' https://github.com/google/googletest', 'v1.10.x', False, ],
  ['grpc', 'https://github.com/grpc/grpc', 'v1.36.x', False, ],
  ['asio', 'https://github.com/build-with-bazel/asio', 'master', True, ],
]

CLONE = 'git clone {url} --depth 1 --branch {branch} --single-branch {dir}'
SUBMODULE = 'git submodule update --init --depth 1'

if __name__ == '__main__':
  workspace_dir = os.path.dirname(os.path.abspath(__file__))
  print('in ' + workspace_dir)

  print("init submodule ...")
  os.system("git submodule update --init")

  print("init external lib ...")
  lib_dir = os.path.abspath(workspace_dir + '/../lib')
  print('in ' + lib_dir)
  if not os.path.exists(lib_dir):
    print('create lib dir')
    os.makedirs(lib_dir)
  os.chdir(lib_dir)
  
  for repo in local_repos:
    name = repo[0]
    cmd = CLONE.format(dir=name, url=repo[1], branch=repo[2])
    print(cmd)

    if not os.path.exists(name):
      os.system(cmd)
      if  repo[3] and os.path.exists(name):
        os.chdir(repo[0])
        os.system(SUBMODULE)
        os.chdir('..')

    else:
      print('skip ' + name)

  print('done')