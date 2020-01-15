App.cable.subscriptions.create('RatesChannel', {
  received(data) {
    $(document).trigger(CONSTANTS.Events['change-rate'], data.rate);
  }
});
