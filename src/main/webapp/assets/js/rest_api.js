baseUrl =  window.location.origin+'/rest';
function getRequest(getUrl){
    var responseData = [];
    $.ajax({
        type: 'GET',
        async: false,
        url: baseUrl + getUrl,
        dataType: "json",
        success: function(data) {
            responseData.push(data);
            responseData.push(true);
        },
        error: function(data) {
            responseData.push(data);
            responseData.push(false);
        }
    });
    return responseData;
}
function postRequest(postUrl,postData){
    var responseData = [];
    $.ajax({
        type: 'POST',
        async: false,
        url: baseUrl + postUrl,
        data: JSON.stringify(postData),
        success: function(data) {
             //alert(JSON.stringify(data));
             responseData.push(data);
             responseData.push(true);
        },
        contentType: 'application/json',
        dataType: 'json',
        error: function(data) {
            //alert(JSON.stringify(data));
            responseData.push(data);
            responseData.push(false);
        }
    });
    return responseData;
}

function getCourseCount() {
    getUrl = '/course/count';
    jsonData = getRequest(getUrl);
    return jsonData;
}
function getSpecialisationCount(){
    getUrl = '/specialisation/count';
    jsonData = getRequest(getUrl);
    return jsonData;
}
function getCourseList(){
    getUrl = '/course/list';
    jsonListData = getRequest(getUrl);
    return jsonListData;
}
function getSpecialisationList(){
    getUrl = '/specialisation/list';
    jsonListData = getRequest(getUrl)[0];
    return jsonListData;
}
function containsCourse(label){
    getUrl = '/course/tag/contains/'+label;
    jsonData = getRequest(getUrl);
    return jsonData;
}
function containsCourseId(label){
    getUrl = "/course/tag/containsid/"+label;
    jsonData = getRequest(getUrl);
    return jsonData;
}
function containsSpecialisation(label){
    getUrl = '/specialisation/tag/contains/'+label;
    jsonData =  getRequest(getUrl);
    return jsonData['reuslt'];
}
function getCourse(label){
    getUrl = '/course/tag/'+label;
    jsonData = getRequest(getUrl)[0];
    return jsonData;
}
function getCourseById(id){
    getUrl = '/course/id/'+id;
    jsonData = getRequest(getUrl);
    return jsonData;
}
function getSpecialisation(label){
    getUrl = '/specialisation/tag/'+label;
    jsonData =  getRequest(getUrl)[0];
    return jsonData;
}
function getSpecialisatoinById(id){
    getUrl = '/specialisation/id/'+id;
    jsonData = getRequest(getUrl);
    return jsonData;
}
function postCourse(postData){
    postUrl = '/course/post';
    jsonData = postRequest(postUrl,postData);
    return jsonData;
}
function postSpecialisation(postData){
    postUrl = '/specialisation/post';
    jsonData = postRequest(postUrl,postData)[0];
    return jsonData;
}
function postCourseList(postData){
    postUrl = '/course/post/list';
    jsonData = postRequest(postUrl,postData)[0];
    return jsonData;
}
function postSpecialisationList(postData){
    postUrl = '/specialisation/post/list';
    jsonData = postRequest(postUrl,postData)[0];
    return jsonData;
}

function updateCourse(postData){
    postUrl = '/course/update';
    jsonData = postRequest(postUrl,postData);
    return jsonData;
}
function updateSpecialisation(postData){
    postUrl = '/specialisation/update';
    jsonData = postRequest(postUrl,postData);
    return jsonData;
}
function isValid(id1,id2){
    getUrl = "/course/valid/from/"+id1+"/to/"+id2;
    jsonData = getRequest(getUrl);
    return jsonData;
}
function deleteCourse(id){
    getUrl = "/course/delete/"+id;
    jsonData = getRequest(getUrl);
    return jsonData;
}
function deleteSpecialisation(id){
    getUrl = '/specialisation/delete/'+id;
    jsonData = getRequest(getUrl);
    return jsonData;
}

function getAppendOption(tag,name,id){
    return  '<option value="'+tag+'" id='+id+'>'+tag+' : '+name+'</option>'
}

$.fn.extend({
       populateCourses : function () {
           var element = $(this);
           var jsonData = getCourseList()[0];
           for(var i in jsonData){
               element.append(getAppendOption(jsonData[i]['courseTag'],jsonData[i]['courseName'],jsonData[i]['id']));
           }
       },
        populateUpdateCourses : function (id) {
            var element = $(this);
            var jsonData = getCourseList()[0];
            for(var i in jsonData){
                var status = isValid(jsonData[i]['id'],id);
                if(status[1]===false){
                    alert("Error : Populating");
                    return;
                }
                if(status[0]['result']===true)
                element.append(getAppendOption(jsonData[i]['courseTag'],jsonData[i]['courseName'],jsonData[i]['id']));
            }
        },
       populateSpecialisation : function () {
           var element = $(this);
           var jsonData = getSpecialisationList();
           for (var i in jsonData) {
               element.append(getAppendOption(jsonData[i]['specialisationTag'],jsonData[i]['specialisationName'],jsonData[i]['id']));
           }
       },
       getPrerequisiteCources : function () {
           var element = $(this);
           var courses = [];
           element.each(function () {
               courses.push(getCourseById($(this).attr('id'))[0]);
           });
           return courses;
       }, 
        getSpecialisationCourses : function() {
            var element = $(this);
            var specialisation = [];
            element.each(function () {
                specialisation.push(getSpecialisatoinById($(this).attr('id'))[0]);

            });
            //alert(JSON.stringify(specialisation));
            return specialisation;
        },

        makeCourseJson : function (courses,specialisation) {
            json = {};
            json['courseTag'] = $('#courseTag').val();
            var status  = containsCourse(json['courseTag']);
            if(status[1]===false){
                new PNotify({
                    title: 'Error',
                    text: 'Try re-submitting form.',
                    addclass: 'bg-danger border-danger'
                });
                return;
            }else{
                if(status[0]['result']===true){
                    new PNotify({
                        title: 'Error',
                        text: 'Course tag already exist.',
                        addclass: 'bg-warning border-warning'
                    });
                    return;
                }
            }
            json['courseName'] = $('#courseName').val();
            json['capacity'] = parseInt($('#courseCapacity').val());
            json['credits'] = parseInt($('#courseCredits').val());
            json['prerequisiteVOS'] = courses;
            json['specialisations'] = specialisation;

            // alert(JSON.stringify(json));
            jsonResponse = postCourse(json);

            if(jsonResponse[1]===true){
                //alert("sucesss : "+JSON.stringify(jsonResponse[0]));
                new PNotify({
                    title: 'Success',
                    text: 'Course '+json['courseTag']+' added successfully.',
                    addclass: 'bg-success border-success'
                });
            }else{
                // alert("failer : "+JSON.stringify(jsonResponse[0]));
                new PNotify({
                    title: 'Error',
                    text: 'Try re-submitting form.',
                    addclass: 'bg-danger border-danger'
                });
            }
        },
        updateCourseJson : function (courses,specialisation) {
            // alert(JSON.stringify(courses));
            // alert(JSON.stringify(specialisation));
            var jsonData = containsCourseId($('#courseTag').val());
            if(jsonData[1]===false){
                new PNotify({
                    title: 'Error',
                    text: 'Try re-submitting form.',
                    addclass: 'bg-danger border-danger'
                });
                return
            }
            var dbID = jsonData[0]['result'];
            var currentID = parseInt($('#courseForm').attr("name"));
            // alert($('#courseTag').val());
            // alert(JSON.stringify(jsonData));
            // alert(dbID+" "+currentID);
            if(dbID>0&&!(dbID===currentID)){
                new PNotify({
                    title: 'Error',
                    text: 'Course tag already exist in update.',
                    addclass: 'bg-warning border-warning'
                });
                return;
            }
            json = {};
            json['id'] = currentID;
            json['courseTag'] = $('#courseTag').val();
            json['courseName'] = $('#courseName').val();
            json['capacity'] = parseInt($('#courseCapacity').val());
            json['credits'] = parseInt($('#courseCredits').val());
            json['prerequisiteVOS'] = courses;
            json['specialisations'] = specialisation;
            //alert(JSON.stringify(json));

            jsonResponse = updateCourse(json);

            if(jsonResponse[1]===true){
                // alert("sucesss : "+JSON.stringify(jsonResponse[0]));
                new PNotify({
                    title: 'Success',
                    text: 'Course '+json['courseTag']+' updated successfully.',
                    addclass: 'bg-success border-success'
                });
            }else{
                // alert("failer : "+JSON.stringify(jsonResponse[0]));
                new PNotify({
                    title: 'Error',
                    text: 'Try re-submitting form.',
                    addclass: 'bg-danger border-danger'
                });
            }


        }

});


