/**
 * Created by Chris on 12/13/2017.
 */
({
    packItem : function(component, event){
        var item = component.get("v.item");
        item.Packed__c = true;
        component.set("v.item", item);
        component.set("v.disabled", true);
    }
})