'use strict';
/** 
 * controller for Validation Form example
 */
app.controller('crearEdificioCtrl2', ["$scope", "EdificioFactory", "$location", "SweetAlert",
    function ($scope, EdificioFactory, $location, SweetAlert) {
        $scope.edificio = {
            idedificio: "",
            nombre: "",
            pisos: ""
        };
        $scope.master = angular.copy($scope.edificio);
        $scope.form = {
            submit: function (form) {
                var firstError = null;
                if (form.$invalid) {

                    var field = null, firstError = null;
                    for (field in form) {
                        if (field[0] != '$') {
                            if (firstError === null && !form[field].$valid) {
                                firstError = form[field].$name;
                            }

                            if (form[field].$pristine) {
                                form[field].$dirty = true;
                            }
                        }
                    }

                    angular.element('.ng-invalid[name=' + firstError + ']').focus();
                    SweetAlert.swal("El formulario no puede ser enviado porque contiene errores de validación!", "Los errores estan resaltados con color rojo!", "error");
                    return;
                } else {
                    if (form.$valid) {
                        EdificioFactory.save($scope.edificio).$promise.then(function () {
                            $location.path("app/edificios/listar");
                        }, function (bussinessMessages) {
                            $scope.bussinessMessages = bussinessMessages;
                        });
                        // SweetAlert.swal("Good job!", "Your form is ready to be submitted!", "success");
                    }
                }

            },
            reset: function (form) {
                $scope.edificio = angular.copy($scope.master);
                form.$setPristine(true);
            }
        };


    }]);
app.controller('editarEdificioCtrl2', ["$scope", "$state", "$stateParams", "EdificioFactory", "$location", "SweetAlert",
    function ($scope, $state, $stateParams, EdificioFactory, $location, SweetAlert) {
        EdificioFactory.get({idEdificio: $stateParams.idedificio}).$promise.then(function (result) {
            $scope.edificio = result;
            $scope.master = angular.copy($scope.edificio);
        });
        $scope.form = {
            submit: function (form) {
                var firstError = null;
                if (form.$invalid) {

                    var field = null, firstError = null;
                    for (field in form) {
                        if (field[0] != '$') {
                            if (firstError === null && !form[field].$valid) {
                                firstError = form[field].$name;
                            }

                            if (form[field].$pristine) {
                                form[field].$dirty = true;
                            }
                        }
                    }

                    angular.element('.ng-invalid[name=' + firstError + ']').focus();
                    SweetAlert.swal("El formulario no puede ser enviado porque contiene errores de validación!", "Los errores estan resaltados con color rojo!", "error");
                    return;
                } else {
                    if (form.$valid) {
                        EdificioFactory.update({idEdificio: $scope.edificio.idedificio}, $scope.edificio).$promise.then(function () {
                            $location.path("app/edificios/listar");
                        }, function (bussinessMessages) {
                            $scope.bussinessMessages = bussinessMessages;
                        });
                        // SweetAlert.swal("Good job!", "Your form is ready to be submitted!", "success");
                    }
                }

            },
            reset: function (form) {
                $scope.edificio = angular.copy($scope.master);
                form.$setPristine(true);
            }
        };
    }]);
app.controller('ValidationCtrl2', ["$scope", "$state", "SweetAlert", function ($scope, $state, SweetAlert) {

        $scope.master = $scope.myModel;
        $scope.form = {
            submit: function (form) {
                var firstError = null;
                if (form.$invalid) {

                    var field = null, firstError = null;
                    for (field in form) {
                        if (field[0] != '$') {
                            if (firstError === null && !form[field].$valid) {
                                firstError = form[field].$name;
                            }

                            if (form[field].$pristine) {
                                form[field].$dirty = true;
                            }
                        }
                    }

                    angular.element('.ng-invalid[name=' + firstError + ']').focus();
                    SweetAlert.swal("The form cannot be submitted because it contains validation errors!", "Errors are marked with a red, dashed border!", "error");
                    return;
                } else {
                    SweetAlert.swal("Good job!", "Your form is ready to be submitted!", "success");
                    //your code for submit
                }

            },
            reset: function (form) {

                $scope.myModel = angular.copy($scope.master);
                form.$setPristine(true);
            }
        };
    }]);
