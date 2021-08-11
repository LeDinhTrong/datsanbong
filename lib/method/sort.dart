class Sort implements Comparable {
  int distances;
  Sort(this.distances);

  @override
  int compareTo(other) {
    if (this.distances < other.distances) {
      return 1;
    }

    if (this.distances > other.distances) {
      return -1;
    }

    if (this.distances == other.distances) {
      return 0;
    }

    return 3;
  }
}
