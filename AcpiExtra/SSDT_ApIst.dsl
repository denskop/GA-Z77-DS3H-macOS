DefinitionBlock ("", "SSDT", 1, "PmRef", "ApIst", 0x00003000)
{
    External (_PR_.CPU0.APSS, IntObj)
    External (_PR_.CPU1, DeviceObj)
    External (_PR_.CPU2, DeviceObj)
    External (_PR_.CPU3, DeviceObj)
    External (_PR_.CPU4, DeviceObj)
    External (_PR_.CPU5, DeviceObj)
    External (_PR_.CPU6, DeviceObj)
    External (_PR_.CPU7, DeviceObj)

    Scope (\_PR.CPU1)
    {
        Method (APSS, 0, NotSerialized)
        {
            Return (\_PR.CPU0.APSS) /* External reference */
        }
    }

    Scope (\_PR.CPU2)
    {
        Method (APSS, 0, NotSerialized)
        {
            Return (\_PR.CPU0.APSS) /* External reference */
        }
    }

    Scope (\_PR.CPU3)
    {
        Method (APSS, 0, NotSerialized)
        {
            Return (\_PR.CPU0.APSS) /* External reference */
        }
    }

    Scope (\_PR.CPU4)
    {
        Method (APSS, 0, NotSerialized)
        {
            Return (\_PR.CPU0.APSS) /* External reference */
        }
    }

    Scope (\_PR.CPU5)
    {
        Method (APSS, 0, NotSerialized)
        {
            Return (\_PR.CPU0.APSS) /* External reference */
        }
    }

    Scope (\_PR.CPU6)
    {
        Method (APSS, 0, NotSerialized)
        {
            Return (\_PR.CPU0.APSS) /* External reference */
        }
    }

    Scope (\_PR.CPU7)
    {
        Method (APSS, 0, NotSerialized)
        {
            Return (\_PR.CPU0.APSS) /* External reference */
        }
    }
}

