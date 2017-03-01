/**
 * Created by tran on 11/7/16.
 */
var tid;
var start;
var elapsed;
var word;
var test;
var timeCircle = 2000;
var listWord = [];

function isEmpty(str) {
    return (!str || 0 === str.length);
}

/**
 * to be called when circle time enough
 * @return void
 */

$( document ).ready(function() {

    $( "#input_search" ).autocomplete({
        source: function( request, response ) {
            $.ajax({
                url : '/searchword/listword',
                dataType: "json",
                data: {
                    word: $("#input_search").val()
                },
                success: function( data ) {
                    response( $.map( data, function( item ) {
                        return {
                            label: item.strWord,
                        }
                    }));
                }
            });
        },
        autoFocus: true,
        minLength: 0
    }).keypress(function () {
        $(this).autocomplete("search");
    });
});

