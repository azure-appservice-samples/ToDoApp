'use strict';
multiChannelToDoApp
    .controller('ToDoController', ['$scope', 'toDoService', function ($scope, toDoService) {

        $scope.itemCount = 0;

        $scope.get = function () {

            $scope.loading = true;

            toDoService.getItems()
                .success(function (data) {
                    $scope.itemCount = data.length;
                    $scope.items = data;
                    $scope.loading = false;
                })
                .error(function (reason) {
                    console.log(reason);
                    $scope.loading = false;
                });
        };

        $scope.add = function () {
            toDoService.add($scope.itemCount, $scope.itemText)
            .success(function (data) {
                $scope.itemText = '';
                $scope.get();
            });
        };

        $scope.complete = function (item) {
            toDoService.complete(item)
                .success(function (data) {
                    $scope.get();
                });
        };

        $scope.get();

    }]);