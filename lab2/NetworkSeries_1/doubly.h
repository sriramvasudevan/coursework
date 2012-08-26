/* 
 * File:   doubly.h
 * Author: sriram
 *
 * Created on 26 August, 2012, 12:17 PM
 */

#ifndef DOUBLY_H
#define	DOUBLY_H

#ifdef	__cplusplus
extern "C" {
#endif
    
    /********************************************************/
    /*  Circular, doubly linked list function definitions.  */
    /********************************************************/
    
    void doubly_receiveMessage();
    void doubly_printAllMessages();
    void doubly_sendMessage();
    void doubly_sendAllSenderMessages();
    void doubly_sendAllReceiverMessages();


#ifdef	__cplusplus
}
#endif

#endif	/* DOUBLY_H */

