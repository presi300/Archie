# Archie
Archie is a simple way to install arch linux on any computer!
It's simple. Boot from iso. Clone. Start. Follow installer instructions. Done!


## Now some actual help:

**1. Boot from an arch linux iso/installation media.**
** **
**2. Type:**
>pacman -Syy

**3. Install git:**
>pacman -S git

**4. Clone Archie from github:**
>git clone https://github.com/presi300/Archie

**5. Navigate to the Archie directory:**
>cd Archie

**6. Start Archie**
>bash Archie.sh

**7. Follow the on-screen instructions**
** **
**8. Done!**

## Other stuff
**-What is Archie?**

>Archie is a simple bash script installer for arch linux. It's all terminal based. Simply enter your choice, hit enter and repeat until the end of the install.
>
>One important thing you should know before using Archie is that it is simple. It doesn't check for spelling mistakes or improperly formatted partitions. So read everything you type in twice.

**-Who is Archie ment for?**

>Archie is made with complete linux beginners in mind. It's for people who want to try arch linux but have only used ubuntu or haven't tried linux at all.
>
>It's also made for people that in general just wanna try arch linux but aren't fully confident that they can install it.

**-Why archie instead of archinstall?**

>*Archie* is a lot simpler than *archinstall* and sets up a lot more things for the end user. That might be a good or a bad thing, depending on how you look at it and how much you know about arch linux.

**-Any guarantee that Archie will work with everything?**

>Archie has been tested with both virtual machine software (VMWare/Virtualbox) with both BIOS and UEFI and bare-metal hardware (again both UEFI and BIOS) with very good results with both. That being said there is still no 100% guarantee it will work with EVERY hardware configuration.

**-Is it better than archinstall?**

>Yes and No... Yes, in a way that it's a lot simpler for 1st timers to use/setup. No, in a way that it's not nearly as well written or customizable as *archinstall*.

**-How can i help developement if I want to?**

>I am not that good at bash scripting and this is my 1st project. Generally any feedback or suggestions on how to make it better will go a long way.

**-What about Nvidia drivers?**

>If you have used Archie, you would know that it doesn't have an option to setup Nvidia drivers, which is one of the main things new users struggle with.
>
>Simple: I have absolutely no way to test if the Nvidia drivers will work when setup with the script. Also i am not sure on what is the best way to setup Nvidia drivers, so that they don't break. Again... feedback and suggestions will go a long way here.
