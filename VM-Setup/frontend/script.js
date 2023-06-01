((window, document, undefined) => {
  'use strict';

  const CLOCK_URL = '/clock';

  const clockTime = document.getElementById('clockTime');
  const clockDate = document.getElementById('clockDate');

  function fetchEpoch(onFetch) {
    return fetch(CLOCK_URL)
      .then(response => response.text())
      .then(onFetch)
      .catch(error => console.error('Error fetching clock:', error));
  }

  function refreshClock() {
    fetchEpoch(setClockEpoch);
  }

  function setClockEpoch(epoch) {
    const date = new Date(0);
    date.setUTCSeconds(epoch);
    clockTime.textContent = formatTime(date);
    clockDate.textContent = formatDate(date);
  }

  function formatDate(date) {
    return [
      ('0' + date.getDate()).slice(-2),
      ('0' + (date.getMonth() + 1)).slice(-2),
      date.getFullYear()
    ].join('/');
  }

  function formatTime(date) {
    return [
      ('0' + date.getHours()).slice(-2),
      ('0' + date.getMinutes()).slice(-2),
      ('0' + date.getSeconds()).slice(-2)
    ].join(':');
  }

  function clockInterval(interval) {
    setInterval(refreshClock, interval || 500);
  }

  clockInterval();

})(window, document, undefined);

