'use strict';
/**
 * Controller of the angularBootstrapCalendarApp
 */
app.controller('CalendarCtrl', ["$scope", "$aside", "moment", "SweetAlert",
    "MantenimientoFactory", "AulaFactory", function ($scope, $aside, moment,
            SweetAlert, MantenimientoFactory, AulaFactory) {

        MantenimientoFactory.query().$promise.then(function (result) {
            $scope.events = result;
            AulaFactory.query().$promise.then(function (result3) {
                $scope.aulas = result3;

                moment.locale('es', {
                    week: {
                        dow: 1 // Monday is the first day of the week
                    }
                });

                var vm = this;
                var date = new Date();
                var d = date.getDate();
                var m = date.getMonth();
                var y = date.getFullYear();

                $scope.calendarView = 'month';
                $scope.calendarDay = new Date();

                function showModal(action, event) {
                    var modalInstance = $aside.open({
                        templateUrl: 'calendarEvent.html',
                        placement: 'right',
                        size: 'md',
                        backdrop: true,
                        controller: function ($scope, $modalInstance) {
                            $scope.$modalInstance = $modalInstance;
                            $scope.action = action;
                            $scope.event = event;
                            $scope.cancel = function () {
                                $modalInstance.dismiss('cancel');
                            };
                            $scope.deleteEvent = function () {
                                $modalInstance.close($scope.event, $scope.event);
                            };

                        }
                    });
                    modalInstance.result.then(function (selectedEvent, action) {

                        $scope.eventDeleted(selectedEvent);

                    });
                }


                $scope.eventClicked = function (event) {
                    showModal('Clicked', event);
                };
                $scope.addEvent = function () {
                    $scope.eventoTemporal = {
                        idmantenimiento: "",
                        title: 'Nuevo Mantenimiento2',
                        startsAt: new Date(y, m, d, 10, 0),
                        endsAt: new Date(y, m, d, 11, 0),
                        type: 'preventivo',
                        leido: "",
                        prioridad: "",
                        fueraServicio: "",
                        aprobado: ""
                    }
                    $scope.eventEdited($scope.eventoTemporal);
                };

                $scope.eventEdited = function (event) {
                    showModal('Edited', event);
                };

                $scope.eventDeleted = function (event) {

                    SweetAlert.swal({
                        title: "Are you sure?",
                        text: "Your will not be able to recover this event!",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Yes, delete it!",
                        cancelButtonText: "No, cancel plx!",
                        closeOnConfirm: false,
                        closeOnCancel: false
                    }, function (isConfirm) {
                        if (isConfirm) {
                            $scope.events.splice(event.$id, 1);
                            SweetAlert.swal("Deleted!", "Event has been deleted.", "success");
                        } else {
                            SweetAlert.swal("Cancelled", "Event is safe :)", "error");
                        }
                    });
                };


                $scope.toggle = function ($event, field, event) {
                    $event.preventDefault();
                    $event.stopPropagation();

                    event[field] = !event[field];
                };

            });



        });
    }]);
