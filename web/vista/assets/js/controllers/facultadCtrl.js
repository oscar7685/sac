'use strict';
/**
 * controllers for ng-table
 * Simple table with sorting and filtering on AngularJS
 */

app.controller('listFacultades', ["$scope", "$filter", "ngTableParams", "FacultadFactory", function ($scope, $filter, ngTableParams, FacultadFactory) {
        FacultadFactory.query().$promise.then(function (datos) {
            $scope.data = datos;
            $scope.tableParams = new ngTableParams({
                page: 1, // show first page
                count: 10, // count per page
                sorting: {
                    name: 'asc' // initial sorting
                }
            }, {
                total: $scope.data.length, // length of dataEdificios
                getData: function ($defer, params) {
                    //sorting
                    var orderedData = params.sorting() ? $filter('orderBy')($scope.data, params.orderBy()) : $scope.data;

                    //filtering
                    orderedData = $filter('filter')(orderedData, params.filter());
                    $scope.aux = orderedData.slice((params.page() - 1) * params.count(), params.page() * params.count());

                    //pagination
                    params.total(orderedData.length);
                    $defer.resolve($scope.aux);
                }
            });
        });

    }]);
app.controller('crearFacultadCtrl', ["$scope", "FacultadFactory", "$location", "SweetAlert", function ($scope, FacultadFactory, $location, SweetAlert) {
        $scope.facultad = {
            idfacultad: "",
            facultad: ""
        };

        $scope.master = angular.copy($scope.facultad);
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
                        FacultadFactory.save($scope.facultad).$promise.then(function () {
                            $location.path("app/facultades/listar");
                        }, function (bussinessMessages) {
                            $scope.bussinessMessages = bussinessMessages;
                        });
                        // SweetAlert.swal("Good job!", "Your form is ready to be submitted!", "success");
                    }
                }

            },
            reset: function (form) {
                $scope.facultad = angular.copy($scope.master);
                form.$setPristine(true);
            }
        };

    }]);
app.controller('editarFacultadCtrl', ["$scope", "$state", "$stateParams", "FacultadFactory", "$location", "SweetAlert",
    function ($scope, $state, $stateParams, FacultadFactory, $location, SweetAlert) {
        FacultadFactory.get({idFacultad: $stateParams.idfacultad}).$promise.then(function (result) {
            $scope.facultad = result;
            $scope.master = angular.copy($scope.facultad);
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

                        FacultadFactory.update({idFacultad: $scope.facultad.idfacultad}, $scope.facultad).$promise.then(function () {
                            $location.path("app/facultades/listar");
                        }, function (bussinessMessages) {
                            $scope.bussinessMessages = bussinessMessages;
                        });
                        //SweetAlert.swal("Good job!", "Your form is ready to be submitted!", "success");
                    }
                }

            },
            reset: function (form) {
                $scope.facultad = angular.copy($scope.master);
                form.$setPristine(true);
            }
        };
    }]);
