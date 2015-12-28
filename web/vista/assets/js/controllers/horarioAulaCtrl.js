/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

app.controller('horarioAulaCtrl', ["$scope", "DiasFactory", "HoraFactory", "$location", "SweetAlert",
    function($scope, DiasFactory, HoraFactory, $location, SweetAlert) {
        DiasFactory.query().$promise.then(function(result) {
            $scope.dias = result;

            HoraFactory.query().$promise.then(function(result2) {
                $scope.horas = result2;
            });

        });
    }]);


