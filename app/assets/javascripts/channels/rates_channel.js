App.cable.subscriptions.create('RatesChannel', {
  received(data) {
    const { rate } = data;
    const { Events } = CONSTANTS;
    $(document).trigger(Events['change-rate'], rate.rate);
    $(document).trigger(Events['update-timer'], rate.force_date);
  }
});
