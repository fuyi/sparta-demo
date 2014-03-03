'use strict';

var demoApp = angular.module('demoApp',[
'ngResource'
]);

demoApp.controller('DemoController',['$scope','Competitions',function($scope,Competitions){

  Competitions.query(function(response){
    $scope.competitions = response;
  });

  // add competiiton event
  $scope.add_button_click = function(){
    var Comp = $scope.Comp;
    if(Comp){
      var params = {};
      params.competition = Comp;
      Competitions.save(params, function(data){
        $scope.competitions.push(data);
        $scope.Comp.name='';
    });
    }
    else{
      alert('please set competition name');
    }
};

    // remove competition
    $scope.remove=function(item){
      var index=$scope.competitions.indexOf(item)

      var params = {id:item.id};

      Competitions.delete_comp(params, function(){
          $scope.competitions.splice(index,1);
      });
    }

}]);

demoApp.factory('Competitions',['$resource',
    function($resource){
        return $resource('competitions/:id',
                  {id:'@id'}, //params
                  {// action
                    delete_comp: {
                      method: 'DELETE'
                    }
                  }
                );
}]);
