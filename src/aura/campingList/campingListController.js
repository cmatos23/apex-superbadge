/**
 * Created by ChristopherMatos on 12/18/2017.
 */
({
    doInit : function(component, event){
        var action = component.get("c.getItems");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {

                component.set("v.items", response.getReturnValue());
            }
            else{
                console.error(response.getError()[0].message)
            }
        });
        $A.enqueueAction(action);
    },
     clickCreateItem : function(component, event){

         var validItem = component.find('campingform').reduce(function (validSoFar, inputCmp) {
                    // Displays error messages for invalid fields
                    inputCmp.showHelpMessageIfInvalid();
                    return validSoFar && inputCmp.get('v.validity').valid;
                }, true);
        // If we pass error checking, do some real work
        if(validItem){
             var items = component.get("v.items");
            items.push(newItem);
            component.set("v.items", items);

            component.set("v.newItem", {'sobjectType' : 'Camping_Item__c', 'Quantity__c' : 0, 'Price__c' : 0});

        }
    }
})