'use strict';
/**
 * controllers for ng-table
 * Simple table with sorting and filtering on AngularJS
 */

var data = [{
        id: 1,
        name: "A101",
        tipo: "Aula",
        capacidad: "30",
        estado: "Activa"
    }, {
        id: 2,
        name: "A102",
        tipo: "Aula",
        capacidad: "30",
        estado: "Activa"
    }, {
        id: 3,
        name: "A103",
        tipo: "Aula",
        capacidad: "25",
        estado: "Activa"
    }, {
        id: 4,
        name: "A201",
        tipo: "Aula",
        capacidad: "30",
        estado: "Activa"
    }, {
        id: 5,
        name: "A202",
        tipo: "Aula",
        capacidad: "20",
        estado: "Inactiva"
    }, {
        id: 6,
        name: "A203",
        tipo: "Aula especializada",
        capacidad: "30",
        estado: "Activa"
    }, {
        id: 7,
        name: "A203",
        tipo: "Aula especializada",
        capacidad: "15",
        estado: "Activa"
    }, {
        id: 8,
        name: "B101",
        tipo: "Aula",
        capacidad: "50",
        estado: "Activa con Novedad"
    }, {
        id: 9,
        name: "A203",
        tipo: "Aula especializada",
        capacidad: "30",
        estado: "Activa"
    }];


app.controller('ngTableCtrl', ["$scope", "$filter", "ngTableParams", function ($scope, $filter, ngTableParams) {
        $scope.tableParams = new ngTableParams({
            page: 1, // show first page
            count: 5, // count per page
            sorting: {
                name: 'asc' // initial sorting
            }
        }, {
            total: data.length, // length of data
            getData: function ($defer, params) {
                var filteredData = params.sorting() ? $filter('orderBy')(data, params.orderBy()) : data;
                var orderedData = $filter('filter')(filteredData, params.filter());
                $scope.users = orderedData.slice((params.page() - 1) * params.count(), params.page() * params.count());
                params.total(orderedData.length);
                // set total for recalc pagination
                $defer.resolve($scope.users);

            }
        });
    }]);

app.controller('editarEdificioCtrl', ["$scope", "$state", "$stateParams", "EdificioFactory", "$location", "SweetAlert", function ($scope, $state, $stateParams, EdificioFactory, $location, SweetAlert) {
        console.log("llegando aca22");  
        $scope.edificio = EdificioFactory.get({idEdificio: $stateParams.idedificio});
        var edificioInicial = $scope.edificio;
        $scope.master = edificioInicial;
        console.log(edificioInicial.nombre);

        $scope.form = {
            submit: function (form) {

                if ($scope.form.$valid) {

                    console.log("nuevo:" + $scope.form.$valid);
                } else {
                    console.log("nuevo2:" + $scope.form.$valid);

                }

                /* var firstError = null;
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
                 
                 SweetAlert.swal("Good job!", "Your form is ready to be submitted!", "success");
                 }
                 console.log("form.$valid:" + form.$valid);
                 /*  $scope.guardar = function () {
                 if ($scope.form.$valid) {
                 EdificioFactory.save($scope.edificio).then(function () {
                 $location.path("/listar");
                 }, function (bussinessMessages) {
                 $scope.bussinessMessages = bussinessMessages;
                 });
                 } else {
                 alert("Hay datos inválidos");
                 }
                 };
                 
                 
                 
                 }*/

            },
            reset: function (form) {
                $scope.edificio = angular.copy($scope.master);
                form.$setPristine(true);
            }
        };




    }]);
app.controller('ngTableCtrlEdificio', ["$scope", "$filter", "EdificioFactory", "ngTableParams", function ($scope, $filter, EdificioFactory, ngTableParams) {
        EdificioFactory.query().$promise.then(function (result) {
            $scope.data = result;
            $scope.tableParams = new ngTableParams({
                page: 1, // show first page
                count: 10, // count per page
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
app.controller('ngTableCtrlProfesores', ["$scope", "$filter", "ngTableParams", function ($scope, $filter, ngTableParams) {
        var profesores = [{
                "id": 1,
                "lm": 138661285100,
                "fn": "John Smith",
                "dc": "CEO",
                "em": "j.smith@company.com",
                "ph": "617-321-4567",
                "ac": true,
                "dl": false
            }, {
                "id": 2,
                "lm": 138661285200,
                "fn": "Lisa Taylor",
                "dc": "VP of Marketing",
                "em": "l.taylor@company.com",
                "ph": "617-522-5588",
                "ac": true,
                "dl": false
            }, {
                "id": 3,
                "lm": 138661285300,
                "fn": "James Jones",
                "dc": "VP of Sales",
                "em": "j.jones@company.com",
                "ph": "617-589-9977",
                "ac": true,
                "dl": false
            }, {
                "id": 4,
                "lm": 138661285400,
                "fn": "Paul Wong",
                "dc": "VP of Engineering",
                "em": "p.wong@company.com",
                "ph": "617-245-9785",
                "ac": true,
                "dl": false
            }, {
                "id": 5,
                "lm": 138661285500,
                "fn": "Alice King",
                "dc": "Architect",
                "em": "a.king@company.com",
                "ph": "617-244-1177",
                "ac": true,
                "dl": false
            }, {
                "id": 6,
                "lm": 138661285600,
                "fn": "Jan Brown",
                "dc": "Software Engineer",
                "em": "j.brown@company.com",
                "ph": "617-568-9863",
                "ac": true,
                "dl": false
            }, {
                "id": 7,
                "lm": 138661285700,
                "fn": "Ami Garcia",
                "dc": "Software Engineer",
                "em": "a.garcia@company.com",
                "ph": "617-327-9966",
                "ac": true,
                "dl": false
            }, {
                "id": 8,
                "lm": 138661285800,
                "fn": "Jack Green",
                "dc": "Software Engineer",
                "em": "j.green@company.com",
                "ph": "617-565-9966",
                "ac": true,
                "dl": false
            }, {
                "id": 9,
                "lm": 138661285900,
                "fn": "Abraham Liesen",
                "dc": "Plumber",
                "em": "a.liesen@company.com",
                "ph": "617-523-4468",
                "ac": true,
                "dl": false
            }, {
                "id": 10,
                "lm": 138661286000,
                "fn": "Angela Bower",
                "dc": "Product Manager",
                "em": "a.bower@company.com",
                "ph": "617-877-3434",
                "ac": true,
                "dl": false
            }, {
                "id": 11,
                "lm": 138661286100,
                "fn": "Fjodor Davidoff",
                "dc": "Database Admin",
                "em": "f.davidoff@company.com",
                "ph": "617-446-9999",
                "ac": true,
                "dl": false
            }, {
                "id": 12,
                "lm": 138661286200,
                "fn": "Biljana Vitrovic",
                "dc": "Director of Communications",
                "em": "b.vitrovic@company.com",
                "ph": "617-111-1111",
                "ac": true,
                "dl": false
            }, {
                "id": 13,
                "lm": 138661286300,
                "fn": "Guillaume Valet",
                "dc": "Software Engineer",
                "em": "g.valet@company.com",
                "ph": "617-565-4412",
                "ac": true,
                "dl": false
            }, {
                "id": 14,
                "lm": 138661286400,
                "fn": "Min Tran",
                "dc": "Gui Designer",
                "em": "m.tran@company.com",
                "ph": "617-866-2554",
                "ac": true,
                "dl": false
            }];
        $scope.tableParams = new ngTableParams({
            page: 1, // show first page
            count: 5, // count per page
            sorting: {
                name: 'asc' // initial sorting
            }
        }, {
            total: profesores.length, // length of dataEdificios
            getData: function ($defer, params) {
                // use build-in angular filter
                var filteredData = params.sorting() ? $filter('orderBy')(profesores, params.orderBy()) : profesores;
                var orderedData = $filter('filter')(filteredData, params.filter());
                $scope.aux2 = orderedData.slice((params.page() - 1) * params.count(), params.page() * params.count());
                params.total(orderedData.length);
                // set total for recalc pagination
                $defer.resolve($scope.aux2);
            }
        });
    }]);
app.controller('ngTableCtrl3', ["$scope", "$filter", "ngTableParams", function ($scope, $filter, ngTableParams) {
        $scope.tableParams = new ngTableParams({
            page: 1, // show first page
            count: 5, // count per page
            filter: {
                name: 'M' // initial filter
            }
        }, {
            total: data.length, // length of data
            getData: function ($defer, params) {
                // use build-in angular filter
                var orderedData = params.filter() ? $filter('filter')(data, params.filter()) : data;
                $scope.users = orderedData.slice((params.page() - 1) * params.count(), params.page() * params.count());
                params.total(orderedData.length);
                // set total for recalc pagination
                $defer.resolve($scope.users);
            }
        });
    }]);
app.controller('ngTableCtrl4', ["$scope", "$filter", "ngTableParams", function ($scope, $filter, ngTableParams) {
        $scope.tableParams = new ngTableParams({
            page: 1, // show first page
            count: 10 // count per page

        }, {
            total: data.length, // length of data
            getData: function ($defer, params) {
                // use build-in angular filter
                var orderedData = params.sorting() ? $filter('orderBy')(data, params.orderBy()) : data;
                $defer.resolve(orderedData.slice((params.page() - 1) * params.count(), params.page() * params.count()));
            }
        });
    }]);
app.controller('ngTableCtrl5', ["$scope", "$filter", "ngTableParams", function ($scope, $filter, ngTableParams) {
        $scope.tableParams = new ngTableParams({
            page: 1, // show first page
            count: 10 // count per page
        }, {
            total: data.length, // length of data
            getData: function ($defer, params) {
                // use build-in angular filter
                var orderedData = params.sorting() ? $filter('orderBy')(data, params.orderBy()) : data;
                $defer.resolve(orderedData.slice((params.page() - 1) * params.count(), params.page() * params.count()));
            }
        });
    }]);
app.controller('ngTableCtrl6', ["$scope", "$filter", "ngTableParams", function ($scope, $filter, ngTableParams) {
        var data = [{
                "id": 1,
                "lm": 138661285100,
                "ln": "Smith",
                "fn": "John",
                "dc": "CEO",
                "em": "j.smith@company.com",
                "ph": "617-321-4567",
                "ac": true,
                "dl": false
            }, {
                "id": 2,
                "lm": 138661285200,
                "ln": "Taylor",
                "fn": "Lisa",
                "dc": "VP of Marketing",
                "em": "l.taylor@company.com",
                "ph": "617-522-5588",
                "ac": true,
                "dl": false
            }, {
                "id": 3,
                "lm": 138661285300,
                "ln": "Jones",
                "fn": "James",
                "dc": "VP of Sales",
                "em": "j.jones@company.com",
                "ph": "617-589-9977",
                "ac": true,
                "dl": false
            }, {
                "id": 4,
                "lm": 138661285400,
                "ln": "Wong",
                "fn": "Paul",
                "dc": "VP of Engineering",
                "em": "p.wong@company.com",
                "ph": "617-245-9785",
                "ac": true,
                "dl": false
            }, {
                "id": 5,
                "lm": 138661285500,
                "ln": "King",
                "fn": "Alice",
                "dc": "Architect",
                "em": "a.king@company.com",
                "ph": "617-244-1177",
                "ac": true,
                "dl": false
            }, {
                "id": 6,
                "lm": 138661285600,
                "ln": "Brown",
                "fn": "Jan",
                "dc": "Software Engineer",
                "em": "j.brown@company.com",
                "ph": "617-568-9863",
                "ac": true,
                "dl": false
            }, {
                "id": 7,
                "lm": 138661285700,
                "ln": "Garcia",
                "fn": "Ami",
                "dc": "Software Engineer",
                "em": "a.garcia@company.com",
                "ph": "617-327-9966",
                "ac": true,
                "dl": false
            }, {
                "id": 8,
                "lm": 138661285800,
                "ln": "Green",
                "fn": "Jack",
                "dc": "Software Engineer",
                "em": "j.green@company.com",
                "ph": "617-565-9966",
                "ac": true,
                "dl": false
            }, {
                "id": 9,
                "lm": 138661285900,
                "ln": "Liesen",
                "fn": "Abraham",
                "dc": "Plumber",
                "em": "a.liesen@company.com",
                "ph": "617-523-4468",
                "ac": true,
                "dl": false
            }, {
                "id": 10,
                "lm": 138661286000,
                "ln": "Bower",
                "fn": "Angela",
                "dc": "Product Manager",
                "em": "a.bower@company.com",
                "ph": "617-877-3434",
                "ac": true,
                "dl": false
            }, {
                "id": 11,
                "lm": 138661286100,
                "ln": "Davidoff",
                "fn": "Fjodor",
                "dc": "Database Admin",
                "em": "f.davidoff@company.com",
                "ph": "617-446-9999",
                "ac": true,
                "dl": false
            }, {
                "id": 12,
                "lm": 138661286200,
                "ln": "Vitrovic",
                "fn": "Biljana",
                "dc": "Director of Communications",
                "em": "b.vitrovic@company.com",
                "ph": "617-111-1111",
                "ac": true,
                "dl": false
            }, {
                "id": 13,
                "lm": 138661286300,
                "ln": "Valet",
                "fn": "Guillaume",
                "dc": "Software Engineer",
                "em": "g.valet@company.com",
                "ph": "617-565-4412",
                "ac": true,
                "dl": false
            }, {
                "id": 14,
                "lm": 138661286400,
                "ln": "Tran",
                "fn": "Min",
                "dc": "Gui Designer",
                "em": "m.tran@company.com",
                "ph": "617-866-2554",
                "ac": true,
                "dl": false
            }];
        $scope.tableParams = new ngTableParams({
            page: 1,
            count: 10
        }, {
            total: data.length,
            getData: function ($defer, params) {
                var orderedData = params.sorting() ? $filter('orderBy')(data, params.orderBy()) : data;
                $defer.resolve(orderedData.slice((params.page() - 1) * params.count(), params.page() * params.count()));
            }
        });
        $scope.editId = -1;
        $scope.setEditId = function (pid) {
            $scope.editId = pid;
        };
    }]);
