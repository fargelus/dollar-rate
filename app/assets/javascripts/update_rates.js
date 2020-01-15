$(() => {
  const updateRates = () => {
    setTimeout(
      () => $(document).trigger(CONSTANTS.Events['change-rate']),
      CONSTANTS.Timer.second,
    );
  };

  $(document).on(CONSTANTS.Events.timeout, updateRates);
});
