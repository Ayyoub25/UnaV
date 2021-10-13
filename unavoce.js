import { LightningElement ,wire,api,track } from 'lwc';
import getAccount from '@salesforce/apex/LocationApp1.getAccount';


export default class Unavoce extends LightningElement {
    @track accounts;
    @wire (getAccount)
    wiredAccounts({error,data}) {
        if (data) {
            this.accounts = data;
        } else if (error) {
            console.log(error);
            this.error = error;
        }
    }
}

