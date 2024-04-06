class GGLock {
  bool isLocked;

  GGLock({required this.isLocked});

  bool lock() {
    if (isLocked) {
      return true;
    }

    isLocked = true;
    return false;
  }

  void release() {
    isLocked = false;
  }
}
