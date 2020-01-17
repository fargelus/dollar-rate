import React from "react"
import PropTypes from "prop-types"
import TimeSince from "../helpers/time_since";
import TimeoutDispatcher from '../helpers/timeout_dispatcher';


class Timer extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      remainTime: '',
    };
    this.timeLeft = {};
    this.timerID;
  }

  componentDidMount() {
    this.triggerTick(this.props.timeout);
    this.listenUpdateEvent();
  }

  triggerTick(timeout) {
    this.setRemainTime(timeout);
    this.resetTimer();
    this.tick();
  }

  setRemainTime(timeout) {
    this.timeLeft = TimeSince(timeout);
    this.setState({
      remainTime: this.timeLeftView()
    });
  }

  timeLeftView() {
    let { hours, minutes, seconds } = this.timeLeft;
    hours = this.zeroView(hours);
    minutes = this.zeroView(minutes);
    seconds = this.zeroView(seconds);
    const { separator } = CONSTANTS.Timer;
    return `${hours}${separator}${minutes}${separator}${seconds}`;
  }

  zeroView(param) {
    return ('' + param).length == 1 ? `0${param}` : param;
  }

  resetTimer() {
    clearInterval(this.timerID);
  }

  tick() {
    const that = this;
    this.timerID = setInterval(() => {
      that.countDown();
      that.setState({
        remainTime: that.timeLeftView()
      });

      if (that.timeExpired()) {
        TimeoutDispatcher();
        that.resetTimer();
      }
    }, CONSTANTS.Timer.second);
  }

  countDown() {
    let { hours, minutes, seconds } = this.timeLeft;
    if (seconds > 0) {
      seconds -= 1;
    } else if (minutes > 0) {
      minutes -= 1;
      seconds = 59;
    } else if (hours > 0) {
      hours -= 1;
      minutes = 59;
    }

    this.timeLeft = { hours: hours, minutes: minutes, seconds: seconds };
  }

  timeExpired() {
    const { hours, minutes, seconds } = this.timeLeft;
    return hours == 0 && minutes == 0 && seconds == 0;
  }

  listenUpdateEvent() {
    const updateTimerEvent = CONSTANTS.Events['update-timer'];
    const that = this;
    $(document).on(updateTimerEvent, timeout => {that.triggerTick(timeout)});
  }

  timeNotCountable() {
    const { remainTime } = this.state;
    const { separator } = CONSTANTS.Timer;
    return remainTime.split(separator)
                     .filter(time => isNaN(+time))
                     .length;
  }

  render() {
    if (this.timeNotCountable()) {
      this.resetTimer();
      return <div></div>;
    }

    const timeout = this.timeExpired();
    return (
      <div className={timeout ? 'fade-out' : ''}>
        До обновления курса осталось: { this.state.remainTime }
      </div>
    );
  }
}

Timer.propTypes = {
  timeout: PropTypes.string
};


export default Timer
