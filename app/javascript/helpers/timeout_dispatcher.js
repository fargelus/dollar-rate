function TimeoutDispatcher() {
  const timeoutEvent = CONSTANTS.Events.timeout;
  const event = new Event(timeoutEvent);
  document.dispatchEvent(event);
}

export default TimeoutDispatcher;
