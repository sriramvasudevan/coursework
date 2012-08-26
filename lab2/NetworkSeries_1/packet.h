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

    struct singly_Packet {
        char sender[50];
        char receiver[50];
        char message[50];
        struct singly_Packet *next;
    };

    extern struct singly_Packet *last;

    struct doubly_Packet {
        char sender[50];
        char receiver[50];
        char message[50];
        struct doubly_Packet *prev;
        struct doubly_Packet *next;
    };

    extern struct doubly_Packet *current;

#ifdef	__cplusplus
}
#endif

#endif	/* PACKET_H */

