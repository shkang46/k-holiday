import { api, LightningElement } from "lwc";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class ErrorDisplay extends LightningElement {
    @api errorMessage;
}

export const logError = (component, error) => {
    const componentName = component.title;
    const errorLocation = `Error in "${componentName}"`;

    console.group(errorLocation);
    console.error(error);
    console.groupEnd();

    component.errorMessage = error?.message || error?.body?.message || component.errorMessage || "Unexpected Error";

    if (typeof error === "string") component.errorMessage = error;

    component.dispatchEvent(
        new ShowToastEvent({
            title: errorLocation + ": " + (error?.name || error?.body?.name || ""),
            message: component.errorMessage,
            variant: "error",
            mode: "sticky"
        })
    );

    component.isLoading = false;
};
