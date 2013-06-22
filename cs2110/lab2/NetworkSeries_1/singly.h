/* 
 * File:   singly.h
 * Author: vsriram
 *
 * Created on 6 August, 2012, 7:59 PM
 */

#ifndef SINGLY_H
#define	SINGLY_H

#ifdef	__cplusplus
extern "C" {
#endif

    /********************************************************/
    /*        Singly linked list function definitions.      */
    /********************************************************/
    
    void singly_receiveMessage();
    void singly_printAllMessages();
    void singly_sendMessage();
    void singly_sendAllSenderMessages();
    void singly_sendAllReceiverMessages();

#ifdef	__cplusplus
}
#endif

#endif	/* SINGLY_H */

