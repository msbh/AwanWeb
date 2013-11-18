$(document).ready(function() {






    $('#sel1').change(function() {



        selval = $('#sel1 option:selected').val();
      


        $('body').translateTextNodes('', selval, {
            not: 'select',
            trim: false,
            stripWhitespace: true



        });


    });

    function getMakeDesc() {
        $.post("basichandler.ashx?StrMethodName=GETMAKEDESC", {
            make_id: $("#ctl00_ContentPlaceHolder1_ddlMake option:selected").val()
        }, function(response) {
            $("#ctl00_ContentPlaceHolder1_ddlMakeModel").html(response);


        });
    }




    $("#ctl00_ContentPlaceHolder1_ddlMake").change(getMakeDesc);




})
