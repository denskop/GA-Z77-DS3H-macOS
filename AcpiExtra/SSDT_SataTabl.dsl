DefinitionBlock ("", "SSDT", 1, "APPLE ", "SataAhci", 0x00001000)
{
    External (\_SB_.PCI0.SATA, DeviceObj)
    External (GTF0, IntObj)
    External (GTF1, IntObj)
    External (GTF2, IntObj)
    
    Scope (\)
    {
        Name (GTF3, Buffer (0x07)
        {
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00         // .......
        })
        
        Name (GTF4, Buffer (0x07)
        {
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00         // .......
        })
        
        Name (GTF5, Buffer (0x07)
        {
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00         // .......
        })
    }

    Scope (\_SB.PCI0.SATA)
    {
        Device (PRT0)
        {
            Name (_ADR, 0xFFFF)  // _ADR: Address
            Method (_SDD, 1, NotSerialized)  // _SDD: Set Device Data
            {
                Name (GBU0, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00         // .......
                })
                CreateByteField (GBU0, 0x00, GB00)
                CreateByteField (GBU0, 0x01, GB01)
                CreateByteField (GBU0, 0x02, GB02)
                CreateByteField (GBU0, 0x03, GB03)
                CreateByteField (GBU0, 0x04, GB04)
                CreateByteField (GBU0, 0x05, GB05)
                CreateByteField (GBU0, 0x06, GB06)
                If ((SizeOf (Arg0) == 0x0200))
                {
                    CreateWordField (Arg0, 0x9C, W780)
                    If ((W780 & 0x08))
                    {
                        GB00 = 0x10
                        GB01 = 0x03
                        GB06 = 0xEF
                    }
                    Else
                    {
                        GB00 = 0x90
                        GB01 = 0x03
                        GB06 = 0xEF
                    }
                }

                GTF0 = GBU0 /* \_SB_.PCI0.SATA.PRT0._SDD.GBU0 */
            }

            Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
            {
                Return (GTF0) /* External reference */
            }
        }

        Device (PRT1)
        {
            Name (_ADR, 0x0001FFFF)  // _ADR: Address
            Method (_SDD, 1, NotSerialized)  // _SDD: Set Device Data
            {
                Name (GBU1, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00         // .......
                })
                CreateByteField (GBU1, 0x00, GB10)
                CreateByteField (GBU1, 0x01, GB11)
                CreateByteField (GBU1, 0x02, GB12)
                CreateByteField (GBU1, 0x03, GB13)
                CreateByteField (GBU1, 0x04, GB14)
                CreateByteField (GBU1, 0x05, GB15)
                CreateByteField (GBU1, 0x06, GB16)
                If ((SizeOf (Arg0) == 0x0200))
                {
                    CreateWordField (Arg0, 0x9C, W781)
                    If ((W781 & 0x08))
                    {
                        GB10 = 0x10
                        GB11 = 0x03
                        GB16 = 0xEF
                    }
                    Else
                    {
                        GB10 = 0x90
                        GB11 = 0x03
                        GB16 = 0xEF
                    }
                }

                GTF1 = GBU1 /* \_SB_.PCI0.SATA.PRT1._SDD.GBU1 */
            }

            Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
            {
                Return (GTF1) /* External reference */
            }
        }
        
        Device (PRT2)
        {
            Name (_ADR, 0x0002FFFF)  // _ADR: Address
            Method (_SDD, 1, NotSerialized)  // _SDD: Set Device Data
            {
                Name (GBU2, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00         // .......
                })
                CreateByteField (GBU2, 0x00, GB20)
                CreateByteField (GBU2, 0x01, GB21)
                CreateByteField (GBU2, 0x02, GB22)
                CreateByteField (GBU2, 0x03, GB23)
                CreateByteField (GBU2, 0x04, GB24)
                CreateByteField (GBU2, 0x05, GB25)
                CreateByteField (GBU2, 0x06, GB26)
                If ((SizeOf (Arg0) == 0x0200))
                {
                    CreateWordField (Arg0, 0x9C, W782)
                    If ((W782 & 0x08))
                    {
                        GB20 = 0x10
                        GB21 = 0x03
                        GB26 = 0xEF
                    }
                    Else
                    {
                        GB20 = 0x90
                        GB21 = 0x03
                        GB26 = 0xEF
                    }
                }

                GTF2 = GBU2 /* \_SB_.PCI0.SATA.PRT1._SDD.GBU2 */
            }

            Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
            {
                Return (GTF2) /* External reference */
            }
        }
        
        Device (PRT3)
        {
            Name (_ADR, 0x0003FFFF)  // _ADR: Address
            Method (_SDD, 1, NotSerialized)  // _SDD: Set Device Data
            {
                Name (GBU3, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00         // .......
                })
                CreateByteField (GBU3, 0x00, GB30)
                CreateByteField (GBU3, 0x01, GB31)
                CreateByteField (GBU3, 0x02, GB32)
                CreateByteField (GBU3, 0x03, GB33)
                CreateByteField (GBU3, 0x04, GB34)
                CreateByteField (GBU3, 0x05, GB35)
                CreateByteField (GBU3, 0x06, GB36)
                If ((SizeOf (Arg0) == 0x0200))
                {
                    CreateWordField (Arg0, 0x9C, W783)
                    If ((W783 & 0x08))
                    {
                        GB30 = 0x10
                        GB31 = 0x03
                        GB36 = 0xEF
                    }
                    Else
                    {
                        GB30 = 0x90
                        GB31 = 0x03
                        GB36 = 0xEF
                    }
                }

                GTF3 = GBU3 /* \_SB_.PCI0.SATA.PRT0._SDD.GBU3 */
            }

            Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
            {
                Return (GTF3) /* External reference */
            }
        }
        
        Device (PRT4)
        {
            Name (_ADR, 0x0004FFFF)  // _ADR: Address
            Method (_SDD, 1, NotSerialized)  // _SDD: Set Device Data
            {
                Name (GBU4, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00         // .......
                })
                CreateByteField (GBU4, 0x00, GB40)
                CreateByteField (GBU4, 0x01, GB41)
                CreateByteField (GBU4, 0x02, GB42)
                CreateByteField (GBU4, 0x03, GB43)
                CreateByteField (GBU4, 0x04, GB44)
                CreateByteField (GBU4, 0x05, GB45)
                CreateByteField (GBU4, 0x06, GB46)
                If ((SizeOf (Arg0) == 0x0200))
                {
                    CreateWordField (Arg0, 0x9C, W784)
                    If ((W784 & 0x08))
                    {
                        GB40 = 0x10
                        GB41 = 0x03
                        GB46 = 0xEF
                    }
                    Else
                    {
                        GB40 = 0x90
                        GB41 = 0x03
                        GB46 = 0xEF
                    }
                }

                GTF4 = GBU4 /* \_SB_.PCI0.SATA.PRT0._SDD.GBU4 */
            }

            Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
            {
                Return (GTF4) /* External reference */
            }
        }
        
        Device (PRT5)
        {
            Name (_ADR, 0x0005FFFF)  // _ADR: Address
            Method (_SDD, 1, NotSerialized)  // _SDD: Set Device Data
            {
                Name (GBU5, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00         // .......
                })
                CreateByteField (GBU5, 0x00, GB50)
                CreateByteField (GBU5, 0x01, GB51)
                CreateByteField (GBU5, 0x02, GB52)
                CreateByteField (GBU5, 0x03, GB53)
                CreateByteField (GBU5, 0x04, GB54)
                CreateByteField (GBU5, 0x05, GB55)
                CreateByteField (GBU5, 0x06, GB56)
                If ((SizeOf (Arg0) == 0x0200))
                {
                    CreateWordField (Arg0, 0x9C, W785)
                    If ((W785 & 0x08))
                    {
                        GB50 = 0x10
                        GB51 = 0x03
                        GB56 = 0xEF
                    }
                    Else
                    {
                        GB50 = 0x90
                        GB51 = 0x03
                        GB56 = 0xEF
                    }
                }

                GTF5 = GBU5 /* \_SB_.PCI0.SATA.PRT0._SDD.GBU5 */
            }

            Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
            {
                Return (GTF5) /* External reference */
            }
        }
    }
}

