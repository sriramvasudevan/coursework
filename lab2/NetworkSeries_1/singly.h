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

    void receiveMessage();
    void printAllMessages();
    void sendMessage();
    void sendAllSenderMessages();
    void sendAllReceiverMessages();

#ifdef	__cplusplus
}
#endif

#endif	/* SINGLY_H */

