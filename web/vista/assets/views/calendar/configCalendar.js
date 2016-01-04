/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

'use strict';

var angular = require('angular');

angular
  .module('mwl.calendar')
  .constant('calendarConfig', {
    allDateFormats: {
      angular: {
        date: {
          hour: 'ha',
          day: 'd MMM',
          month: 'MMMM',
          weekDay: 'EEEE',
          time: 'HH:mm',
          datetime: 'MMM d, h:mm a'
        },
        title: {
          day: 'EEEE d MMMM, yyyy',
          week: 'Week {week} of {year}',
          month: 'MMMM yyyy',
          year: 'yyyy'
        }
      },
      moment: {
        date: {
          hour: 'ha',
          day: 'D MMM',
          month: 'MMMM',
          weekDay: 'dddd',
          time: 'HH:mm',
          datetime: 'MMM D, h:mm a'
        },
        title: {
          day: 'dddd D MMMM, YYYY',
          week: 'Week {week} of {year}',
          month: 'MMMM YYYY',
          year: 'YYYY'
        }
      }
    },
    get dateFormats() {
      return this.allDateFormats[this.dateFormatter].date;
    },
    get titleFormats() {
      return this.allDateFormats[this.dateFormatter].title;
    },
    dateFormatter: 'angular',
    displayEventEndTimes: false,
    showTimesOnWeekView: false,
    displayAllMonthEvents: false,
    i18nStrings: {
      eventsLabel: 'Events',
      timeLabel: 'Time',
      weekNumber: 'Week {week}'
    },
    templates: {}
  });

