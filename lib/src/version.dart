part of sdk;

class Version {
  int major = 0;
  int minor = 0;
  int patch = 5;

  Version() {}

  get versionStr => 'v$major.$minor.$patch';

  get versionNum => major * 1000000 + minor * 1000 + patch;
}
