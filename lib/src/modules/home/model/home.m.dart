enum Threads {
  compute('Compute'),
  isolate('Isolate'),
  synchronization('Synchronization'),
  persistence('Persistence Thread'),
  data('Two way Data Passing');

  const Threads(this.title);

  final String title;
}
