/* 
 * File:   packet.h
 * Author: vsriram
 *
 * Created on 6 August, 2012, 7:55 PM
 */

#ifndef PACKET_H
#define	PACKET_H

#ifdef	__cplusplus
extern "C" {
#endif
    struct Packet {
        char sender[50];
        char receiver[50];
        char message[50];
        struct Packet *next;
    };
    
extern struct Packet *last;



#ifdef	__cplusplus
}
#endif

#endif	/* PACKET_H */

