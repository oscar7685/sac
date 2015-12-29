/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

app.controller('horarioAulaCtrl', ["$scope", "DiasFactory", "HoraFactory", "HorarioFactory", "$location", "SweetAlert", "$filter",
    function ($scope, DiasFactory, HoraFactory, HorarioFactory, $location, SweetAlert, $filter) {
        DiasFactory.query().$promise.then(function (result) {
            $scope.dias = result;

            HoraFactory.query().$promise.then(function (result2) {
                $scope.horas = result2;
            });

        });
        HorarioFactory.query().$promise.then(function (result3) {
            $scope.horarios = result3;

            //console.log($scope.filtrado2(1, 1));

        });
    }]);


