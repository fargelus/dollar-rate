function TimeoutDispatcher() {
  const event = new Event('timeout');
  document.dispatchEvent(event);
}

export default TimeoutDispatcher;
