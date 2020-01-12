// Calculates time that will passed since custom date

const TimeSince = endTime => {
  const getMsec = () => Date.parse(endTime) - Date.now();
  const getTimeLeft = msec => {
    const rounder = param => param >= 60 ? param % 60 : param;

    const seconds = parseInt(msec / 1000, 10);
    const minutes = parseInt(seconds / 60, 10);
    const hours = parseInt(minutes / 60, 10);

    return {
      hours: hours,
      minutes: rounder(minutes),
      seconds: rounder(seconds),
    };
  }

  const msec = getMsec();
  if (msec < 0) return null;
  return getTimeLeft(msec);
}

export default TimeSince;
