'use strict';
/**
 * controllers for ng-table
 * Simple table with sorting and filtering on AngularJS
 */
app.filter('propsFilter', function () {
    return function (items, props) {
        var out = [];

        if (angular.isArray(items)) {
            items.forEach(function (item) {
                var itemMatches = false;

                var keys = Object.keys(props);
                for (var i = 0; i < keys.length; i++) {
                    var prop = keys[i];
                    var text = props[prop].toLowerCase();
                    if (item[prop].toString().toLowerCase().indexOf(text) !== -1) {
                        itemMatches = true;
                        break;
                    }
                }

                if (itemMatches) {
                    out.push(item);
                }
            });
        } else {
            // Let the output be the input untouched
            out = items;
        }

        return out;
    };
});
app.controller('listEstudiantes', ["$scope", "$filter", "ngTableParams", "EstudianteFactory", function ($scope, $filter, ngTableParams, EstudianteFactory) {
        EstudianteFactory.query().$promise.then(function (datos) {
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
app.controller('crearEstudianteCtrl', ["$scope", "EstudianteFactory", "CursoFactory", "$location", "SweetAlert", function ($scope, EstudianteFactory, CursoFactory, $location, SweetAlert) {
        CursoFactory.query().$promise.then(function (resultC) {
            $scope.cursos = resultC;
            $scope.curso = {};
            $scope.estudiante = {
                codigo: "",
                nombres: "",
                apellidos: ""
            };
            $scope.multipleDemo = {};
            $scope.multipleDemo.selectedCursos = [];
            $scope.master = angular.copy($scope.estudiante);
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
                            EstudianteFactory.save($scope.estudiante).$promise.then(function () {
                                $location.path("app/estudiantes/listar");
                            }, function (bussinessMessages) {
                                $scope.bussinessMessages = bussinessMessages;
                            });
                            // SweetAlert.swal("Good job!", "Your form is ready to be submitted!", "success");
                        }
                    }

                },
                reset: function (form) {
                    $scope.estudiante = angular.copy($scope.master);
                    form.$setPristine(true);
                }
            };
        });
    }]);
app.controller('editarEstudianteCtrl', ["$scope", "$state", "$stateParams", "EstudianteFactory", "CursoFactory", "$location", "SweetAlert",
    function ($scope, $state, $stateParams, EstudianteFactory, CursoFactory, $location, SweetAlert) {
        CursoFactory.query().$promise.then(function (resultC) {
            $scope.cursos = resultC;
            $scope.curso = {};
            EstudianteFactory.get({codigo: $stateParams.codigo}).$promise.then(function (result) {
                $scope.estudiante = result;
                $scope.master = angular.copy($scope.facultad);
                $scope.multipleDemo = {};
                $scope.multipleDemo.selectedCursos = [$scope.estudiante.cursos];
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

                                EstudianteFactory.update({codigo: $scope.estudiante.codigo}, $scope.estudiante).$promise.then(function () {
                                    $location.path("app/estudiantes/listar");
                                }, function (bussinessMessages) {
                                    $scope.bussinessMessages = bussinessMessages;
                                });
                                //SweetAlert.swal("Good job!", "Your form is ready to be submitted!", "success");
                            }
                        }

                    },
                    reset: function (form) {
                        $scope.estudiante = angular.copy($scope.master);
                        form.$setPristine(true);
                    }
                }
                ;
            });
        });
    }]);
