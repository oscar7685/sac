/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


app.controller('crearProfesorCtrl2', ["$scope", "FacultadFactory", "ProfesorFactory", "$location", "SweetAlert", function ($scope, FacultadFactory, ProfesorFactory, $location, SweetAlert) {
        FacultadFactory.query().$promise.then(function (result) {
            $scope.facultades = result;
            $scope.profesor = {
                idprofesor: "",
                nombre: "",
                codigo: "",
                facultad: {
                    idfacultad: "",
                    facultad: ""
                }
            };
            $scope.master = angular.copy($scope.profesor);
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
                        if (form.$valid) {
                            ProfesorFactory.save($scope.profesor).$promise.then(function () {
                                $location.path("app/profesores/listar");
                            }, function (bussinessMessages) {
                                $scope.bussinessMessages = bussinessMessages;
                            });
                            SweetAlert.swal("Good job!", "Your form is ready to be submitted!", "success");
                        }
                    }

                },
                reset: function (form) {
                    $scope.profesor = angular.copy($scope.master);
                    form.$setPristine(true);
                }
            };
        });
    }]);


app.controller('editarProfesorCtrl2', ["$scope", "$state", "$stateParams", "FacultadFactory", "ProfesorFactory", "$location", "SweetAlert",
    function ($scope, $state, $stateParams, FacultadFactory, ProfesorFactory, $location, SweetAlert) {
        ProfesorFactory.get({idProfesor: $stateParams.idprofesor}).$promise.then(function (result) {
            $scope.profesor = result;
            $scope.master = angular.copy($scope.profesor);
            FacultadFactory.query().$promise.then(function (result2) {
                $scope.facultades = result2;
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
                            if (form.$valid) {

                                ProfesorFactory.update({idProfesor: $scope.profesor.idprofesor}, $scope.profesor).$promise.then(function () {
                                    $location.path("app/profesores/listar");
                                }, function (bussinessMessages) {
                                    $scope.bussinessMessages = bussinessMessages;
                                });
                                SweetAlert.swal("Good job!", "Your form is ready to be submitted!", "success");
                            }
                        }

                    },
                    reset: function (form) {
                        $scope.profesor = angular.copy($scope.master);
                        form.$setPristine(true);
                    }
                };
            });


        });
    }]);


app.controller('tablaProfesoresCtrl', ["$scope", "$filter", "ProfesorFactory", "ngTableParams", function ($scope, $filter, ProfesorFactory, ngTableParams) {
        ProfesorFactory.query().$promise.then(function (result) {
            $scope.data = result;
            $scope.tableParams = new ngTableParams({
                page: 1, // show first page
                count: 5, // count per page
                sorting: {
                    name: 'asc' // initial sorting
                }
            }, {
                total: $scope.data.length, // length of dataEdificios
                getData: function ($defer, params) {
                    // use build-in angular filter
                    var filteredData = params.sorting() ? $filter('orderBy')($scope.data, params.orderBy()) : $scope.data;
                    var orderedData = $filter('filter')(filteredData, params.filter());
                    $scope.aux = orderedData.slice((params.page() - 1) * params.count(), params.page() * params.count());
                    params.total(orderedData.length);
                    // set total for recalc pagination
                    $defer.resolve($scope.aux);
                }
            });
        });
    }]);